Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B566CFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VgeIlMglQgJUe938qG3fSEs1eXSckUK6pwXjrBlPbXA=; b=JM+PjHkPZoXcbzUFuNZimKEge0
	4CGtTXcSfwwC89KhZWJV88ln5p4cG8GWvKtFmiAQ1E05D4pO7QHydNlB+CJ2xeKR1XSFAVJ7r55GC
	lRMUNT1RM81muprP6Rfy6CUNYZyANx1TzbKaT02dzHOhjuQQlzeMiV31eRmKW7v8Wd/QqcZnK70R0
	oYippEJGG6zzAYaAiVkHPxrRB2uvd0TYtH6tbwHnCL4WTSDZ0zpDyYLV3U6o4YZW+10leE5WOIwtC
	O6M7RNJ2+BMTKjUhwOwZd95oQvnZ8Nx31iAPR7ujkGc5X9SRCpfzt+Hd582lFtwk98RTHEs9RI7t8
	+a7dd8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN8Ib-0000000ANLE-1ttg;
	Sun, 23 Nov 2025 11:30:33 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN8IZ-0000000ANKm-2A2u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 11:30:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so4722164a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 03:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763897429; x=1764502229; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VgeIlMglQgJUe938qG3fSEs1eXSckUK6pwXjrBlPbXA=;
        b=Bj91u5sxeCXTOj7lVvOybT/4TmHQQBo5hkW5HlKdS+dppbXJTVWnjDenAoQ8P7u+Bu
         0WFRIpheTnE/Tpn9RPohiOU90XlnhQucMlppCRX/JVSI0aVeUkiv6C6rKhJXZW5qdmZf
         pkjUzvqXnqxxIpRM8c5jnCXvRVKbrdeXUYG5vyw5lA9C5LZWhCeqTJzOWO8RxjyNlI1U
         8TUTMKh59Y03U2OiGR9F1gilqug32SCC7PAM6M0jYsXK71zBKCeKyN8SySutmc2SB4CR
         Q/dyHBclsRNz6QQGBJ6lkPY5HHAwlL0C1/KP2bV6xLrtZiU/ajHxJ2vCrhckuBhsf61a
         vNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763897429; x=1764502229;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgeIlMglQgJUe938qG3fSEs1eXSckUK6pwXjrBlPbXA=;
        b=hzRyQd/3SybpDS/8XIf6fVHVTQ92RuGzAc22sw/PVLJ2RUPYIhu8yhd9faEP8Cxip2
         jCHaMoR1SuRcHXNJRID7mXMI3a2e+5r3qoP+RmTe81P0sCJiTfOZC3kXGZkR/hjwAynb
         gpOoRttLWrMKM3HTE8l4oIhLUh0aLiwt0VECUmDL2o2IL5jJ7xzMEgN3134Znz9hdB1r
         n4fXf/A/28LKRZgHQ69b1rVl7PdUL5SkHZ3zHaM1Rp47cheS3WJHDVT3vCHutvkIGqBc
         /N4RiWG54dhAs3gTyJFEnCIRJyfglfQTlBp8r1DpWLqvTVhFu5q2/17kNqGYJWANOyKg
         at7w==
X-Gm-Message-State: AOJu0Ywha9uLUCBYpzU+VRpdmpf7wGaaERO/sKV50iNx0MbiWrewtt00
	grMtTzu47RM7CHAjldQpxrbUBD5bHaCHvD+cFQpOEnypYfODlf+nDTGPXQOdfDACRkYYodRrbqk
	xsyJwt6nwpePO/5B8O23ffgtlekOulYDGRQpn
X-Gm-Gg: ASbGnct1NGyhRBhnv9uGhA0qyRknpTJ0ucGal1Q7RlxuWEQ4GEJDKLJskeyOKwoy/NO
	46hUloKYVQve3/GdsWYA5J+epN0g103zoHOMUlh3CsKCkW46yyLMBHD45URnvkBUTQQpxzMr/Be
	OApQy42QagAXE1ehD3kJF+KpMBB6ScwDKWkXHRGNeBNxRG7E7Q/ZOJs85+6vTr/bpOvlhFvmxbz
	ECC0OmgNsVgFIWmoxKKoVtinMmEMtKyRgHq6jBTbjfRyF+o72EZ6P52cXY2Il6n13ON
X-Google-Smtp-Source: AGHT+IGKz7sdkbip00rM8Pz695Qx3/+epffebuioXMSXrVtid8YcAa+J1k2eODdUK34aWwaMaAgBxLkSW/09l/DhMxs=
X-Received: by 2002:a17:906:478a:b0:b6d:67b0:ca0b with SMTP id
 a640c23a62f3a-b76719f74e2mr791872166b.61.1763897428588; Sun, 23 Nov 2025
 03:30:28 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?5YiY56uL6LaF?= <liulichao09679@gmail.com>
Date: Sun, 23 Nov 2025 19:30:14 +0800
X-Gm-Features: AWmQ_bmEHDLZPFk-Myx53hT4s9I4I3o2Ubgku_AdnZY__0O_PPabN6J5b7hCtVg
Message-ID: <CAHt-b_NGfmn112yOOBHtO2w63ySy1rJUXAabmMi6D1xuLfysGg@mail.gmail.com>
Subject: What's the memory order about pcie write?
To: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_033031_582607_979D9161 
X-CRM114-Status: UNSURE (   6.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

What's the memory order in this situation:

ARM CPU connects a PCIe NIC(Network Interface Card)
The NIC writes data and descriptor to ARM CPU memory, data and
descriptor are normal memory.
ARM CPU first poll descriptor to know there is a pkt received, then
read the data.

My question:
ARM CPU is weak order, The write of the CPU might be out of order, but
what about the write of the NIC=EF=BC=9FNIC's write order is:write data, th=
en
write descriptor, but if the actual write order become:write
descriptor then write data, it will cause mistake.
I specified the situation to ARM architecture, because X86 is strong
order, so I think NIC writes to X86 is strong order too. Is this
right?

Thanks.

