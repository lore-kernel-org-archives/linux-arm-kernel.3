Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8BFF8A14D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=noPyJziDVldfqPFUfZ4wnm7jRWhwG0vHFhtjn4vftg8=; b=c9IxmzBaChTjaXHeezmWdMqxt+
	fV+KEH8YMQFZA1SrhcLyHkePerjihDPK96MNTxGU1016WJ6scuJojKU87lFiDAeQJo5HYAKPq5nDf
	5bho2dpYOS8jARTR0hm2WwKP29W4e6CgGINPnJgkev7+O8twnTzKEw6gbVeA4h3MR+ewN7Q/5jbQL
	pCOvLd89tA8TXy24sxXg/fh/1DfDFU+rycmah/frRgS9d15i/pmmmgdmcpQ8wEHAYC9C6Fr2gP7/3
	UOg5l1u5OTVWvp4pzOgpxNzl16HpAJsPzb2f0CU4/8AWAY2J3VK/lIu7JWAgDNd4C/evp4b59zKTI
	+sAhbDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJFQ-00000002Fym-42Kc;
	Thu, 16 Apr 2026 09:42:56 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJFO-00000002FyR-1WJy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 09:42:55 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-7b81f5ab95fso13192277b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 02:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776332573; cv=none;
        d=google.com; s=arc-20240605;
        b=S8Es1pRCWBy2gb/MjbPGU53bItR4swSedhQdVFuKQfaW8Xxb8IGzWRcGio2QVVC7hR
         6zHsIP8OIBWTDjMOhenl7vMI9aiMwBk05w3FFjk3Pc1w3mReL7sRdGJDU5DUNBm1WGHe
         sYjkU5kGE/H2dOAyqaAMJr+svs+OHQDFaJXiDoCFvzKwvflbOjHiIbeWFhZGAbWKe6jo
         p755tFQYSIxQo9HTcVMg0+7K+0GTIKq3fvC6VPc62Jc4O7AXzKkCAgeyofBbYdeDzggn
         i6ayves/BcmdhScjLUDcHFsnw9uOqSBXSeixn0dMdBLsChYHlosfaCj5O4aF9sEFjQf5
         zLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=noPyJziDVldfqPFUfZ4wnm7jRWhwG0vHFhtjn4vftg8=;
        fh=8vNO1dkkRYv2WCqrndXkrgBOYNK44ZQ6URpdFRIB6Ck=;
        b=iPz6XX5UkkV8xLpDlf74+QqCbgPhYIrR5ftrNRrWCdSdO3RoXHvYOZAj50O+zcLVFJ
         jhLheGvbl79Ej/rq1BC9tR2IZopT4y7JE+vDsrlFF9Kk1elNuWsaCcucqjXr0bvq5nhU
         qFosvrhyDk+97m6YtR9oCuI83YYMXpofeDgdYux3/2fr/RFEfgTeYx1aw3ST1iHUeczs
         0n676kfmXilm5+1SEG/JkG2oEZshqNAu0zZB+SatwDM0cDHF2LDjlQHC801qWTvJBpeM
         5mdYmaIRdw2hhQZtbYNvq0H6cBmb3GG84lUUgBUotC8T66Gu8cYMUQb2G0ASM2dbJFx8
         mEhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776332573; x=1776937373; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=noPyJziDVldfqPFUfZ4wnm7jRWhwG0vHFhtjn4vftg8=;
        b=WQxSN4Wffv7xGR889XUdfzDJx4eSD0z/D5hzM5zmmk9H2xVgOAGwSH7LG9IeEE/SgG
         wdNAqDfnDHytNkVF0tziJXhz1E9b8qO9VbIYoykqVuOZFaXF8zndGGSWjzalJpmtlChw
         Wyl7qUXkfY07pcJJmdvL6/5lNn7zUVy0dNKqLgrNK30Tjw9Qd4NInEE9hJQBjzAFD6T2
         SPU8+6Owdi7NoFnTqikvpiD5ze6D/m8xQsL+Uflus7x4kbr6ckPJOx8Oe0RzoFF9E0eq
         Y8JpYwxKkOekjSswNKIh+lc1FJar6e/nw8NzqlMv0c+Pg3cheUmygv0ZMV67zLZ+yZmp
         iNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776332573; x=1776937373;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noPyJziDVldfqPFUfZ4wnm7jRWhwG0vHFhtjn4vftg8=;
        b=bnpUzEhwmm2V8Xt50b8+2j0skKvzFNGxMKQgrznbRr6wxbk0/1bv8fgxUo3OrJX69Z
         7uz8rkDEAr6CxaTHGnzi1ZfXKQMGhhsriVNywOMbZcyVFG5L/hS8pSZf887iskj2Oi5U
         pFDJddsqK+qvybC+LmXjGJBXpSH4kcv2FM+RiMXVldrolWCeYTkLtEmv4JwjMgWlRxLp
         kazaor53KlPnlMtQz93FdnNWIDhZARCu7vjgQOe/KEwS2PUMVUvFuvdjOw33zt5jEDdH
         XmU6MiXB16aIROHva1DfjjgGu0lmc92wGwI22GYGJvOmdYVXJq6eCNQpL6b04B+kVu5d
         /J+Q==
X-Gm-Message-State: AOJu0YwWBJSEAspLYR0LO2xADipVkcNMumkfe8jvvWOIVQ8i6cqfDRlh
	XZBf5ZDGa0LchgJ27dHtZEbl4fWLtjVIds8nPbBmSoA6U7kvesv4W+/deCfic+GE8Afb4eJ1pHU
	342K/ziod/cM6pToZQzgIqxfhEs6jLg61FkC4E3lgow==
X-Gm-Gg: AeBDieuZVtT0lUUmHkD+x8urmokt8pssCRR6vLcfkTuLRbS2dPV0r3/Wkby2YWar1r0
	5thENp4ETtDTu32c+ZX7GQ7T6S58KEbnNnTDVHCo5xQOvERnc9H1i4VezZZTuK9UyDRHaX8gl0k
	igASxx3OXitBIWhI5ZJoGwkle75Mf2S/sZz1zb2iOAnMGROGJDwE1++64Eh/emaZh8NJqDV3URq
	OdCYiJGZAcGnLy6/jhFQvTxbLZNxqLMeGJmDrQQf2aJOGkOW5UOcYNax2opDxqfbH7G03sSzOxz
	nfpEjv55gf4MrC5qupr74SCAPSnU7LmGFGI/+BggQil73WujKTqdbInxcJlGbAxuJjuZ7c3wC/I
	gtPM=
X-Received: by 2002:a05:690c:d92:b0:79b:2793:8b0c with SMTP id
 00721157ae682-7af6f80949bmr294675787b3.12.1776332572904; Thu, 16 Apr 2026
 02:42:52 -0700 (PDT)
MIME-Version: 1.0
From: gaming stream <streamg31@gmail.com>
Date: Thu, 16 Apr 2026 15:12:41 +0530
X-Gm-Features: AQROBzCyqIgeNEEdI5x-Xn1GOFvfw9WcSO3jm56VhXP8G3dDBdGdr_mc8p4aZQI
Message-ID: <CA+c6b2E-az8-FQiarZ5s41aZPoes-Aq+Yyq3XkTDwAu6BpF_Gw@mail.gmail.com>
Subject: ACPI dump of HP OmniBook 5 14-he0xxx
To: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_024254_404973_23285754 
X-CRM114-Status: UNSURE (   4.54  )
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

Hi,

I=E2=80=99ve extracted a full ACPI dump from an HP OmniBook 5 14-he0xxx
running Snapdragon X (X126100, Oryon CPU).

This includes DSDT, all SSDTs, and full raw ACPI tables.

Repository: https://github.com/TheXterminator/hp-omnibook-5-snapdragon-x-ac=
pi.git

Sharing in case it helps with Linux bring-up or device tree work
for Snapdragon X platforms.

