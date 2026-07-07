Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DA7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=; b=s/hj4aIf2Mn6V46v3wbuNNqu56
	CKPVQ44flwzj3aUv8sSGn8kU5oox16A6Go8XpvJkk5DhrKK5FdGVtP0LQNP191xpqO+DZP70xPMKk
	+NhO9v+bArKNMpLNME0HdpR/qv8ccqgzYdup/xo6F4KsOGi0YthsLq3NNT419d4jg3NYIYa+Iy8cm
	KGN9I75nTXMIZiSo5z3VM6BOCbMzETZyvV78g9ox1yLDS0OfGnGsk2yziiiquApMRw+EpuzTyEu/Y
	mWc6xnaRn/I9Q+k/gnkoEDzR0HguxJNKpf4Z5MWsVc01d4ebjunHKMfYl9zzycyavrz/H6ptjaVxs
	JrXuBtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5zb-0000000F4UK-1kp4;
	Tue, 07 Jul 2026 13:37:43 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5zV-0000000F4T0-43EN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:37:41 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6675db463b9so1967021d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 06:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783431456; cv=none;
        d=google.com; s=arc-20260327;
        b=p5tMOZy7Nm2i5ImLvHSdhTDaXsdJalbtQtA1M/CGrXFq9LHeS7jF8opsN9T03jiq3s
         9r3qfKNEAnQZ0tNJUIGH9U80UdepRAzPZhflZGvB4FUziuEa+dwK2QNYXLAt3sOGFzEB
         fOBVvcminxVfWq7vGzRDR7sePpdiMylrK2kwWhDUXxtfRt5zedQ8Zas4vSGk2IS0Joth
         3y+janjVSXGJm3BldBFnM8/QPJAqs8McCCJohQSpK47jn8wjKDfr25sEi4AQMYe7Hb9K
         +8COQb0zBIUobwo8/m5OKj5TCvA6aTc50QWyrHciYlqlzWORfLWJ4bETPy6ezOELjavM
         Wbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
        fh=FtFrxHT+I5GdrRUF4Aw4RunTqoBYwhVxVUg5Z+hZbRc=;
        b=rSxLI5M7sg7Cy4LHrwqz0Xz2NvwW0JMouCP/qThH0QhOSrnWw140WnBWDyPk/atbIG
         20qeTem7DfYBeTqv9sSwZ9KbJw+OFhEiO3LG9gzinlVn4qLBffNx/V8GkLLskw0LppQi
         x/Kde3zQlnIAOUlVcXgl0+DoYxYteakbpXA8fBQC5EAAUgWoYibAqeUP2V5+whyP/eVq
         DIURFJA02JB7FuIk00WvT1cg4zV/Mukje3tQj8A9L43MRFdewv3GPWFsj8Hz20TPrvEe
         IXsdDi7YbApEnSboour+2W6EdmXrmG0i+ApSKxF5YcOVXT2LC8uXRJln0690LMQ5HDy0
         AFsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783431456; x=1784036256; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
        b=jMrPNti/eETszT/o6I7WoRdr1pgPkck3jfbXF+3c0BX8//RrZ1ox61bpOqZ9ME95P/
         zED9/sMKmpNJIAo3rcjWeWoh7ibaTN8t+HN36V9mQOGtHgFrnCeqs/epdutqV7HBLaDc
         CU05JHCBPIXWjO5k7WL252MAP1oNAvi0cZmJz0LiH0hmioy9oLmGc910ztacI2ldaM1D
         QF6dX/ujrzlByUtHA6F9FXSX/LToOquBrAF1tj8kBW0pMJ4l8X8yNaJARSpzKfyDE+Ft
         bB0NJW7/p10wpuQoLcIW8dH2T7pJ3hmvYP8MF9CeZDkTnpu6ru0VK3LcM+ZoQqccgvdz
         xA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431456; x=1784036256;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
        b=Egj2uJv2fQ7/GI/ZUiobISoCrl+lMCkZ48ACG5Wk3GgRyf23b0Cww3r8wkadP7693T
         gW2GdGmVA2w9jbvPaD25sxku5uUGZt0AIUuuHYLWmVBy7kM2Vh3oYoiG/7BTD3kwwMfs
         jyJXjrrhncWuRqaBzWcu5ffdlNkM1zYRMSUr/tO2pgXkzRDQvj/Xeg6by8NJYXPlrg/f
         aaVZdlN49dcwGl0T2VD3Rx2F7quB/MNQCa2CwkVYTZWTr819W91qroJYlgt/pcZNrdQY
         4m6Bt49Kq8/mzIlhPw7FFkZBd6F0JlEMzKBlYyKn1l4LEyXUg7I7/wqMeiZzjSF+iilR
         uo+w==
X-Forwarded-Encrypted: i=1; AHgh+Ro1U+Vbo0ynSgjrhoageR/R734xAHoLlJZtxZI2uy+B6MClbVAJS475ltY4ANH6ZuYTbi1vl1sGI3hlSu7bEXSf@lists.infradead.org
X-Gm-Message-State: AOJu0YzxVMMA/9S74gdCC15tr11SV2dZL1ueA9szVXELOy/nr2wQ9dA6
	LFEA19S0Zo3ioxZYdkWo+TZYxNoji4v44XnpjvSYT/SFKNIjzh7SauubBkMCFDDA1Yqb/Wa/+/o
	DvwN1gFcDIbAxUr0N6EXtoUaB2Np1o1M=
X-Gm-Gg: AfdE7cmjwjmsxjcwsIY23CI0jtXnk4GoNddqEMttOG1mE5lIRAAEMGhSVpCZPwrnMEd
	bvEe5cEpqTqBKJCWqlO75idywN+dV6wFddkAkcZqVOwjdv074W8ZcsxVGPVSD25lhaPS/N53Eil
	5hCP5YjZJLNiaR9yWnagUyBs2kIyuFHqDxsyzWb5WrB4Xb9Nmbc/v2lVgc2nTctBlgweSC0m/ta
	yy01WvasRKwUSaM4hhrdFfHX98xi/sBiSKIYMvnkgU77k006jTHI9eOTnKKboLnAXLZnB3HRfGa
	TJPJONKD8HXogP9arIQaClErhyveYUAUm7T/4S65OX2Hgl/Tqs5WQhJGg1f9lw==
X-Received: by 2002:a05:690e:440f:b0:664:ae6a:ef6 with SMTP id
 956f58d0204a3-6677fe09239mr3207984d50.84.1783431455985; Tue, 07 Jul 2026
 06:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com> <a0cee001-7bca-438a-943b-da28528e7df7@gmail.com>
In-Reply-To: <a0cee001-7bca-438a-943b-da28528e7df7@gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Tue, 7 Jul 2026 23:37:24 +1000
X-Gm-Features: AVVi8Cc2ZFlYzV97xsPmmL_XYaVoOo2UdWECw6a41ntBKVYGFTDcsFEpeCIlldE
Message-ID: <CANpmGNusmx8NQEu2x07rX-yd33XA9TJR_ZogFVXexAmw+7qq9A@mail.gmail.com>
Subject: Re: [PATCH 08/10] HID: apple: Add DockChannel HID transport driver
To: Julian Braha <julianbraha@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_063738_012075_738FA0F9 
X-CRM114-Status: GOOD (  11.42  )
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

Hi Julian,

[...]
> APPLE_DOCKCHANNEL_HID has a duplicate dependency on HID,
> since you put the import for this file inside of 'if HID..endif',
> and then also gave it a 'depends on HID'.
>

Thank you for picking it up and letting me know!

I will correct it in v2, which I am planning on sending later this week, or
potentially on the weekend if I get busy.

Thanks again,
Michael

