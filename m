Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41284EE6427
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 10:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edldj1KY5bUh/cjL20OP/olpoho9tkurt3S+4pPFkxE=; b=roS8Q0Ny3n8OYkayBLrH/fAEBh
	9/htp2RyKmPqZtvhFmkMgUjIbqjdvIQgU4/CLZR2em/I/RBoo82KN8cEGB3kauxR+hMi9IZuJejan
	WwGA8oNgMRUF1cF2bHjijQeZUWQESqvLOeZXiG6uD/D81xzu3u2Jz4mOVxXrahz0F5yabO99PSWfS
	tY75vl42yAZoh33+ms5LXcB87WOxmgFodApN4VV9UC7UrYmbEkurCje4G6KWtK3Vx+Cz8osZTFSDX
	/2WWDdycTnG0DhgqAo03HsstofRH0yi3WdI5CWsr0FJkaBiiL18AwsqQyYqwCOn3coN+Wzc32tclf
	+4sxiRZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatHH-00000005sVR-1woN;
	Wed, 31 Dec 2025 10:18:03 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatHE-00000005sV4-1SEs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 10:18:01 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-34b75f7a134so7848478a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 02:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767176279; x=1767781079; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=edldj1KY5bUh/cjL20OP/olpoho9tkurt3S+4pPFkxE=;
        b=fHa4MBuuVK8+1cr0ERvV2Bwiv9Aadaqce78lpxTh7Q8ULXKxLwMtCtaKmn16lJbCOf
         29R7wJLNjtJe+XVa21BXQiwWp1KQ5c8592s9a8LM7LLaczH65erQGEjANa3SGVYsTR/x
         ML2IihpmmwPatoVzQkmfm3mg5W/eXZYjsWtkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767176279; x=1767781079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edldj1KY5bUh/cjL20OP/olpoho9tkurt3S+4pPFkxE=;
        b=v2tDJ/QtmFgCh+mC/7dTR8xVhlyyi/Uz02MTWgvMqyuYHWd7/ygxSB2UT28q0uCQW2
         ShFCxluMtZk3OsTwxxhQXkeVVOMMd81Xj35QLrtBsj6VV1gg6jE2CsWzlmk0n0Ez0hVq
         cWSk/zGJv4C23Gl2I5enJ+QgjvDAYLoRB4F71AOtD5JWUUa5nDxndStnKMkoH9/md9au
         ODcgatoMitAwhMUf+ykeNHS8/SwBc8N4VcZmBRoIJ8Ql9TQwExFlmcNOCacky1nbnfz2
         NXfUpuMrFw8sM2sEVqkNQAYkUgRFd4qh+1v58uxv3uDrV6K6WWDNdBeTnn5xUaONdlL3
         AeJg==
X-Forwarded-Encrypted: i=1; AJvYcCU3ej5NKyHLislu9c9EbyS0doB6WbGo5KNZ9cXjlsgngZQVFiG5NbxWX+EesIZ0Q1YDwBHBUFSt0f4+lStbXrZf@lists.infradead.org
X-Gm-Message-State: AOJu0YzQDhRS6mNIraRpNaY1GWBNhet7PNH63qKnHOq/B4bGqNQFHCNU
	i89uPnAXEzq55yVDElkpWZBvdYachH433D0qDuB4oFFEMUKlzZD1dh9K+VKNyIp0Pg7xF6BjtdU
	qlQAeSpoq+BfX3j/7uxl9ryAhTRcGp80L+CrITKgelA==
X-Gm-Gg: AY/fxX5SrWm5uSKObY7D6n9Fk93SHXIvHMTf+NnVBk8s1RJj2WndkFvNAjkxOrHh27k
	f1l4hdpSqrDTk3izdc93m3I7Yf8DncXpzAa390WAyLAn3dDl+XRb6CdNpS1c0Q1cFsV1ZZRsVnd
	64GBBD7chVCS8upEyNTKXrcrNdA2GJ/qC6mFalMGcpQqty9E730s0hl9eePy4SI07yJ3/tHB6Ad
	9rC041ItdaCR80bKkablRrI0hUI+UjZXkuUY0EnvO8Qw+fQlvBpGpfIKskwrhji3x6qSSrsZjJI
	TFhcQMg=
X-Google-Smtp-Source: AGHT+IG/0csjHsO9S2ju3J4aBxBy0l7c//VGhSAhrGmNUzKzPjS4uC7Pu6z2O1RgSMxmdexSSTPAzAT6Rul7lscbpnM=
X-Received: by 2002:a17:90b:524b:b0:340:f7d6:dc70 with SMTP id
 98e67ed59e1d1-34e9212a312mr30321494a91.13.1767176279136; Wed, 31 Dec 2025
 02:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20251231025502.1139168-1-daniel@0x0f.com> <20251231025502.1139168-4-daniel@0x0f.com>
 <ac0f8b8d-f6e4-4d60-9931-e820417c1abc@kernel.org> <CAFr9PXn_-Ep9HzwTEErZ4Wmm9X8Q2ZkRP1LfmaAMhbYNfJVFuQ@mail.gmail.com>
 <499ce4ea-c6bf-45f1-ab68-c37397196084@kernel.org>
In-Reply-To: <499ce4ea-c6bf-45f1-ab68-c37397196084@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 31 Dec 2025 19:17:48 +0900
X-Gm-Features: AQt7F2qzGbjHCviKYuVDLUPYd2TLUiteeq9BGPgHCi8GDpn6zqZXXjgSMg0gybc
Message-ID: <CAFr9PXkn=ZMd6v=yX_KbfynKq7quBKUnCBDJBaU0LyYYMbKEXA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm: dts: mstar: infinity: Correct opp table name
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: krzk+dt@kernel.org, romain.perier@gmail.com, robh@kernel.org, 
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_021800_610092_2D0B91CE 
X-CRM114-Status: UNSURE (   7.04  )
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

Hi Krzysztof,

On Wed, 31 Dec 2025 at 18:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> I meant, two commits should be rather squashed. If you intend to rename
> the nodes, fix all names to be generic, not only some.

There are 3 commits that correct node names:
arm: dts: mstar: breadbee: Correct regulator names
arm: dts: mstar: breadbee: Correct LED names
arm: dts: mstar: infinity: Correct opp table name

The top two are in the same dts board file, the bottom one is in a
different dtsi file for a chip family.
Should I squash all of them into one commit, squash the top two for
the same board into one commit?

Cheers,

Daniel

