Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51C4D4661C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 19:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=; b=F8MCcSULBHGuObGis5sz0iuije
	OTBiVOpBoVskIXmykMWjusY3h8Pz9kbykFuJjR5i363/UzwudOy6/05RQtxRKHGgxUsav31gvtxkT
	ICpbkRAq2heRIquCkx6VXZfSBZZGZNCVefz5GlBCXn79HJ7/oRxAHT/j36OpgOqlts169AgoZz2N0
	d5DcP13k7knTM1UOoyCk/mnfR/QWqpEoWZ4zN7Q5+5hTeQh3kS69F9SqPDUk0LWOKGr5uoFeyg86r
	BP/MZMNlAu7GSmnGGxPVGKmlFnboxuRfzoqHklp72hfvfEssC4UHxHbIv/Yuzgvze7McNKOVLfiis
	4+688WSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgT8F-0000000D4l1-4189;
	Thu, 15 Jan 2026 19:35:49 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgT8D-0000000D4kj-0abr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 19:35:46 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so11118796d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 11:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768505743; cv=none;
        d=google.com; s=arc-20240605;
        b=e3jX2s9pceB46Sqo49c6RlheyaGtqKpfUvosLvNk3MZtK8PJ/raPEC8jK4gf12EEGJ
         gAGgASbNj7vLh6mu9LQmiGGN2rurMZf5PkwAZaFt1w+60K5sEgxK4QKdV197l9jtivXC
         RH9aP5uazxXa4Rm2uxgi3k7MPApNEqhapx0JNX/3Dk5bnjjm4vFLiAoeIGl0OI9xY8ne
         TUcPt9txNPQsUssKe9DoV06WYO6avGiD/KnFul9xW9PV5D27pX+gkfoYonic+WSFAG44
         V+l7aFINjslHS+TjCirAA86+xS0qBz3j8SIhCtwEfyjmsWJpdZbul7KISkOPzw6Oe3E+
         htJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        fh=8vNO1dkkRYv2WCqrndXkrgBOYNK44ZQ6URpdFRIB6Ck=;
        b=DhuPd0naBzeEYbVsSlbCupGGY21h5raZBP+7z6jtLRvA84U1QKzsGOQ7/4VQIpBBy7
         VpTSmL3pGAE43+xIKNxu+4rmqpHsZFkxNE1BS+KefplC5UOMAQfZJRd83csPI7u9KWiA
         Q/bicx/AhSwX3KP6LSE8+Essx2hFzhE5pQysCbkMKDQW9T2M7CV9K6iJi2aSBsmPEiUp
         BZo1jLYaTTCUCrPmGLUpeNdDIo5h3JkkUysrhSNenpX/qbyJj081FpleIyQtdxudE1Se
         MpJHj6Bgggb6HWZYxqMtEfDzNo9pYkuNo7oQVMguDCUuIawcdVFyVo50U2dWuNUFhCFq
         Qrrw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oasis-open-org.20230601.gappssmtp.com; s=20230601; t=1768505743; x=1769110543; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=YxZXZKjbDKpbi2Z96HUvrl7tpVnPCD4Ikkq8XDTD7IWpJVxtgszI/KXBWZULSc7PFo
         mIcYQsAUbdLz4XBK7BWa0e/y8j1om8aLvb/lPOnFZ+K0ejqdw7wX8YLymxW7k/s1iOqa
         YFyCOWC6jqhhxQke0IVlRozTQek/GjcdHJaLq6SsrKY0EAt6P0dmaU7KvKoRboakY/bz
         k+ld+TCFW9leld+X5aap2KxCY+1U2CMEc5Huux0DXaFSQfXLc0bg5J65eddZ2f6pUTDw
         Pr6Wj5DqCLrP8pyG7vgLRVbI5QbfJVJlSdrbq/32nk4Zi96y44OqLrbToXtS1tYg1DLN
         MsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768505743; x=1769110543;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=mzqqgvQ2MbSs4V0aLkSMv8PS0be3XygZAEFbgZgVqEeTN9E1KnblpjA0XZJIqDX/sU
         wLRBQZNYFfryf0PQUzM/8KB/2ymJ3YuYP5Wik16Il+VYzwwCnQjuUrCrKluFfZNrkLB2
         XB+QopjMLgLSvFRkE+P6EtdkKWnJkyuzSmzHIt+ip/Dhz6aXOwaO/XyT7sFylTFZPWMm
         xr1rmv78ooMmUxKbr0EDfjzg28Rs98Y3uNQW4HjyAZFThJmOl29XQjgCa58vnyMTRyxe
         N2upuXhCERyi3pMHYX7fniihLYgiTdZJdPWVWCVJ4a5DjevowHwg2GMQrSkefvLNy77j
         NvHw==
X-Gm-Message-State: AOJu0Yznfxx7SvJfaIviuId/AH8IluBP+Peq5RN9wr8IZukBbIUkv9EC
	kNDVj0dLpD1nSp4fg535lCSBVKNyepmWwSfqT93ArvKqrkl1k1rtw56LJLqDVU+Vm5FtPAUScMl
	X70HfStTFJqeVg1O4ZiY8qUHmcyZu8l9jfpbJgXZyk4b+IaBbmfjXJb8=
X-Gm-Gg: AY/fxX62ZDn/8+33qcd3MyR3tEGyciSsDHR933vcWQWTfFozvEkAYeDCyZg6u8nDXFd
	ihV5WC0EoSHpeL8kkagJhboK5jpuzFbSY+5OQcfrf9hl4Xf3NafIMMoWu9PfXJSdS+febc3HblL
	uvkD3s1DxHdAys5KQo426bXzp8toCTxNerx5MW517S0P+ST0TuqaOFEW58jB5uTm38PEe3KkJ9T
	eGBeT0i+oZTa8JS/pPg/scqyg5YX+6DlZpbIh5ekGMcQbbpXMOaFDnSPcJ4mRhYZhFn19WHFPv+
	FkQUkRasBluAYcYLjwGFH827L07LrsVslJvk0PpNvGol4A4WpqyPDSOZh+sb
X-Received: by 2002:a05:6214:d47:b0:88a:529a:a53a with SMTP id
 6a1803df08f44-8942dda1d24mr8930856d6.51.1768505743595; Thu, 15 Jan 2026
 11:35:43 -0800 (PST)
MIME-Version: 1.0
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Thu, 15 Jan 2026 14:35:07 -0500
X-Gm-Features: AZwV_QhropN7OOEQe7SzLZu0u6FbF8gq4rxHZ2TE7KF9NIDey1yJAE4n_7mFWGg
Message-ID: <CAAiF603H-2OYj8izUo3jK5Sw-as1kc-+Q-i4a6tf9+Rw6K-6eg@mail.gmail.com>
Subject: Invitation to comment on VIRTIO v1.4 CSD01
To: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_113545_186499_F53D815F 
X-CRM114-Status: UNSURE (   9.62  )
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

OASIS members and other interested parties,

OASIS and the VIRTIO TC are pleased to announce that VIRTIO v1.4 CSD01
is now available for public review and comment.

VIRTIO TC aims to enhance the performance of virtual devices by
standardizing key features of the VIRTIO (Virtual I/O) Device
Specification.

Virtual I/O Device (VIRTIO) Version 1.4
Committee Specification Draft 01 / Public Review Draft 01
09 December 2025

TEX: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.html
(Authoritative)
HTML: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-cs=
prd01.html
PDF: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.pdf

The ZIP containing the complete files of this release is found in the direc=
tory:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
zip

How to Provide Feedback
OASIS and the VIRTIO TC value your feedback. We solicit input from
developers, users and others, whether OASIS members or not, for the
sake of improving the interoperability and quality of its technical
work.

The public review is now open and ends Friday, February 13 2026 at 23:59 UT=
C.

Comments may be submitted to the project=E2=80=99s comment mailing list at
virtio-comment@lists.linux.dev. You can subscribe to the list by
sending an email to
virtio-comment+subscribe@lists.linux.dev.

All comments submitted to OASIS are subject to the OASIS Feedback
License, which ensures that the feedback you provide carries the same
obligations at least as the obligations of the TC members. In
connection with this public review, we call your attention to the
OASIS IPR Policy applicable especially to the work of this technical
committee. All members of the TC should be familiar with this
document, which may create obligations regarding the disclosure and
availability of a member's patent, copyright, trademark and license
rights that read on an approved OASIS specification.

OASIS invites any persons who know of any such claims to disclose
these if they may be essential to the implementation of the above
specification, so that notice of them may be posted to the notice page
for this TC's work.

Additional information about the specification and the VIRTIO TC can
be found at the TC=E2=80=99s public homepage.

