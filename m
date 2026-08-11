Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA0CC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIsnnmjwLbAOrXB5Ycbgn7qG66QGI3o9vwN2stAqMGA=; b=ek9qe9q0tyYio4Olz4PWUx9FIG
	SNs1Bs2Ho1jZC8vrvC9bmCE041Bdty93G/NzeNCUJj246CpHrhlAqxes1lnaS32Spsoh8twHgZ9vv
	qrs7UWFaqXxkrppz8GVc7IkwaE/JrsFPCEAH6RH6kgrltRPNIhUYe3TMFhEgPa9rY2CuVr0lGBaDG
	F+3f9WEnRznEh6ZSoB67o+5NLRmdI0aRE0in/JJrJN+6EpGaBsBv9RsNFrgYQLW5qhOiZYwK0SZ9L
	cPvMU1vX5EfJZBK7C17N81bP/ubXs7PddpByRj8mh5zYJT7lvDCQYumYfyUJ9ylApGl4g3IAhc6RK
	ggwpx8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqXa-0000000EgX5-3L87;
	Tue, 11 Aug 2026 17:45:30 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqXY-0000000EgW7-3g2b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:45:30 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6ae8445b7b6so85055eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 10:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786470326; cv=none;
        d=google.com; s=arc-20260327;
        b=Y1IdmEMhxKsvTykFkbGQeypEkzf1d/d8RonmS3hGZ3hhifSM2OA62E+nD/yDEWD0e+
         +Ymh4YiGZTlA2zNqcXuUzkRgTwi+H+MmJ4vZq5q5UUmv6fy/yHdImcaVnHMK1u5w/Myd
         fbaJ1dNxqK0phA2r+V6w26ml5xetLBX2+KofzXrbUGO3Vtm3alrf4zCG/EfBJCi1wAyV
         BLNVYKExtxZd7p1yXg+Rn1wY6kLsS/qOx9cmKNJRQxv8ZcDUD/MqLXSkjV6HK3P+OXPe
         PNm6a4iXSwz+m7sbduoHTheXuDYkd2mIRKHbJeOikWoGZVpWzIliVcNrCDbvNIS0fIaA
         /3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wIsnnmjwLbAOrXB5Ycbgn7qG66QGI3o9vwN2stAqMGA=;
        fh=zqQp5gmUEx5sNbNVb47OB663l2VaPZTCBGRYtK55UrU=;
        b=S66OiiIvCJ296Rke6o9UKuTHIIMMo9RCvHK2HMvGGeRzYLv4wbSPan254dUxeo0C7a
         6xOlcHOJ8a5ICy7GyMnqV6BYALumOzG2pWRYoEgfxQEkVyyy88u3TZQsBgiBc0VGv+JE
         6LCHKBRBtkkEY/2HQd+dUNdxI2rGufDL5LQJ/orvzl4Rfm6O+vxB3dIYoGCJiqlcz+ym
         jx3ZN2F04bnD4frSs/cl8RoJcmmKvbfOPPmBk6unv5Vsu5K3BjlWPzUfsk/SwGPZwiir
         LC4QsUDdTLEV/nv/jQacRDoZy0EvQ1FFBsULpuzS+BVBH+9fgSf8iTjuAPiYCvnk9pM7
         I1IA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786470326; x=1787075126; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wIsnnmjwLbAOrXB5Ycbgn7qG66QGI3o9vwN2stAqMGA=;
        b=fIg4385MaQabtp5KAkC7Lxkv/lLTPBddNom6F6u1Sw+QkKRfLdbe+k6inqclhSDAsV
         7uPYZSlbrX80FeZVhckBS/p1fAiPL22gq2o9f98MUwZbZ5lWA/cY0mQ0u/x15rgqYgOz
         zms/701x5voRKRPdmzsPHtuRpszK94PObZfavjLctA2uEB2uUU3cA4I+r4ds8rTVJzQf
         wyfWCbCsb7eOZhZYlmBS3CRce6gA3stTBiyCP1A7H0utSA0mrWMjVJLcD5MSdo1Okyln
         22GZIgUZyHfz8vMDysUQgiGh8eaYZpoR0QiVxSsbAmiDfSI8hrvBaiMd6YHnkzZ6CHKn
         vGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786470326; x=1787075126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIsnnmjwLbAOrXB5Ycbgn7qG66QGI3o9vwN2stAqMGA=;
        b=RKTlIxneiW0McNl1Q2mhOM9bU+ML6+viI4zXphZ+9l9T5CJxvfg4Fr5KkPAT7YVWSE
         nGConWfMmT3wNAKPS1yaDMWt/X6qqNr68ZPBuLuM35kcN2oFuplIADF+WWI7sxN27FO/
         iAzuhxHVZZwJVA6GPUFOPdye9AhJDfcBPQzaiPGu6eO+1nrEtHBNqUCZYJbm5zGfBFhV
         3wQaf2wyGGm4yoE32FdwFt48PHblLf8rPM518sPkE2/NTWeGrPZZ+Mg/waQ+aDaBpCj1
         bFe15/faUE758pk6Fhz8rkfPUDIdUuk0CHrduLxsidnad+FHl1ig3fl1ph33sWHmSW8y
         dngw==
X-Forwarded-Encrypted: i=1; AHgh+RplCiulZasyHtX6Hi5nUUwFkj8lGQsDpAHO6kmZU0ZBggJuu51uudIILeTZUOYNM5rIpBbGb0GqadOYbbc2mviL@lists.infradead.org
X-Gm-Message-State: AOJu0YzfhSwJ9Q6KGSoWIcDjSmfvOe1C05Or64zdpynoppSrd6xNReN6
	d9/9Tm3tCxiixFCZT16HdGUWM7pyiedLqw0LmWO3qIlD2P6lcXRSz9BwEi2lBpRqoSwGgxlQtTF
	xrzZ4LlaiKOA2K+bQztgFrRH0j95bdqE=
X-Gm-Gg: AR+sD115x8iSC4MV7IBwpJePikLfK0ydW9fUtjt+f+szmGKp14FzrVD9y6pcC4HlQoi
	4Xbd+chEsA4ku2b1oFEC58mQimfMoRFXqlVRJdtvV9zoVzcqFLunvnx+iXD4TmO/V2it228OchA
	F9ysGM6zO2q/yYsjC/YWpK4YBrkRKXA7fF4SliZolGHIo2vrtNxXrcUmW1dCb8d0seVeFde3pNp
	PKJk63kznFVBV8bTHW9b37HhoGOJBjI7lfwECHE8kQe/O0EaJjHvhKKrQ8UTHDlZBv04PTScUgD
	AXdd4qIO1OvUunX3n5mDTtAqOtvmm2+NhxBvAD7pvFBoZl5afq88WHUO
X-Received: by 2002:a05:6820:2915:b0:6aa:f585:aabb with SMTP id
 006d021491bc7-6b0a2f2947dmr3199144eaf.1.1786470325983; Tue, 11 Aug 2026
 10:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260724084215.51749-1-kr494167@gmail.com>
In-Reply-To: <20260724084215.51749-1-kr494167@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 11 Aug 2026 10:45:14 -0700
X-Gm-Features: AUfX_mxjW_xlo4otJiqTZs1_ynm1tNCuj1j7YfZjC_HUP0fsogXvChIvFlxFLmw
Message-ID: <CABb+yY0CGK82b=rjwkhuc9doBaLrMcw__ru8yX2cmL+3yyBYZg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: cix: validate channel parameters early and
 convert to dev_err_probe
To: kr494167@gmail.com
Cc: gary.yang@cixtech.com, fugang.duan@cixtech.com, 
	cix-kernel-upstream@cixtech.com, peter.chen@cixtech.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_104528_921696_DA2C8D8E 
X-CRM114-Status: GOOD (  10.32  )
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

On Fri, Jul 24, 2026 at 1:42=E2=80=AFAM <kr494167@gmail.com> wrote:
>
> From: Surendra Singh Chouhan <kr494167@gmail.com>
>
> cix_mbox_startup() checked fast channel index constraints (index < 0 ||
> index > CIX_MBOX_FAST_IDX) inside the channel switch block after
> calling request_irq(). If validation failed, it triggered a free_irq()
> cleanup path. Validating channel parameters prior to request_irq()
> avoids unnecessary IRQ registration/teardown churn.
>
> In addition, cix_mbox_probe() logged property errors referencing
> "cix,mbox_dir" (with an underscore) instead of the actual DT property
> name "cix,mbox-dir". Convert cix_mbox_probe() error paths to use
> dev_err_probe() and fix the DT property string spelling.
>
These should be two patches.

Thanks
Jassi

