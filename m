Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014B6CFA451
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVT4x+5HpkJQPwdJsjK0MwsWAxzsoTXRtb4fDO7mWLM=; b=obLd0fBoE4C73NLsBBEl16vXwZ
	POqkNsdQUz5JU26d18zypB2zLZqK6qiNo+kIw1Nt4L9cVd/MyuOyZSHxkryFF/NrSA5Z+My8LF46r
	TdQRcJX0BS/atQod64KnF+kvoqQKEPsmzPZxJDLzMs4e/4+z9vJD1Y7o5CpW9bSLOIODo4PEQckIR
	KrAg8PlABD9aQc6E260hC17cNcP/qwD5/AWzz3muqn87/4y/Kwtlj3qFcxBXzdPc3l/NbNItqEnL5
	NmMw/gbf03VGJSKfvhsRk1l3lI5pjzz0c6qQhnhH4BEIhYJ8snpN9sT/gM8eFj3xAIdBhtNOZJvz8
	xdQ69BbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ump-000000000wu-1BnI;
	Thu, 24 Oct 2024 10:09:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uaq-0000000HZlH-3l3k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:57:26 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539f84907caso780722e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729763842; x=1730368642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVT4x+5HpkJQPwdJsjK0MwsWAxzsoTXRtb4fDO7mWLM=;
        b=mnTh9W4/lr7lecwQPmm/KsqLbUNVWDoyOaqFVoU90G8DcaDMqVi6jcU9kwVPHi6uqn
         j3ZFRp1l1lBdW6Gxn60lix9j3sGJxg/6LYOSLa4AaKgoBpDMZcm/hQF3Yc9NJHPHR4C2
         QNUIMZsN/Ph6UNX5wgsjAYeoVcJxMamZCA28GSiRmMZMHERNM7dJLP4du5NkpXh9794l
         6zX1p72A3DAhlWf1HdS+B2cKb2L7+0eR6b+DQbtAFAgXb+fgJisjVlIhwCk8kOLYqMj9
         g6zdrWhWswL3cDV/rV2Vp5L7ZX922FbRMV5RZZZMDrj/ZaH05zMlLprGaf16lc/jrR7A
         ThAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729763842; x=1730368642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVT4x+5HpkJQPwdJsjK0MwsWAxzsoTXRtb4fDO7mWLM=;
        b=Dy+Jod9Es6PzcLXV+3OO2Z3/5lyM8XSmOdVOdPCEsz+Fn+SQT+tFRC9lCiT5DSinJa
         CPKyzNfzfo9yNUsz1D1K/w3KWzvbSe47Kww33UJyrfKirikoy2eCaFqT96wS1TIzb8xD
         fRqCMAqdsXW20bljly49MSMJjQD78fvyAOdnXd2x6qXkLtnY5l1WDc45PqicKBdAjbo1
         EoFxHJPI5Ue/QAlqvjZVzGKoK8PQ8o2DgF8VOjgOJf0ct7C8RLKjALTiX6o8kGRftSfW
         TQYmNUEOPrdex3MupseTY90GiPZ0kLMm6cHcaFyFyVkVU4ZgtikydxNOxXxHeXwwzufg
         PwnA==
X-Forwarded-Encrypted: i=1; AJvYcCVuhh+zCQ9QMRqYusPStmoDZypiJvBIdOMzKZ9jgrCmMk404Mj+UcI4OBHm4EBBJwgmNT6PnQkDp/hCTCyyLbXV@lists.infradead.org
X-Gm-Message-State: AOJu0YzjlJG0qL32zIBvThTbqo8BcfMEvAtTcBD1kycBvgmunt1JHgc2
	m43iPpDUWMhl4z+z9wO/t/X8h0verB3vMSMP39LVfiYIDv11Njl8
X-Google-Smtp-Source: AGHT+IEoo2Czcs+RGUiJMg6LdY8jxuXv0lNt1Zx6z+DI1lmpOeNWP3pCK2fVmcYSte0wULTaokncdw==
X-Received: by 2002:a05:6512:a90:b0:539:e97c:cb10 with SMTP id 2adb3069b0e04-53b23e857f8mr904316e87.40.1729763841812;
        Thu, 24 Oct 2024 02:57:21 -0700 (PDT)
Received: from seven-swords.. ([2a03:d000:2:9006:4eed:fbff:fe72:e806])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223e5988sm1310862e87.2.2024.10.24.02.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:57:19 -0700 (PDT)
From: Ivan Epifanov <isage.dna@gmail.com>
To: torvalds@linux-foundation.org
Cc: aospan@netup.ru,
	conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org,
	dushistov@mail.ru,
	fancer.lancer@gmail.com,
	geert@linux-m68k.org,
	gregkh@linuxfoundation.org,
	hoan@os.amperecomputing.com,
	ink@jurassic.park.msu.ru,
	jeffbai@aosc.io,
	kexybiscuit@aosc.io,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com,
	netdev@vger.kernel.org,
	nikita@trvn.ru,
	ntb@lists.linux.dev,
	patches@lists.linux.dev,
	richard.henderson@linaro.org,
	s.shtylyov@omp.ru,
	serjk@netup.ru,
	shc_work@mail.ru,
	torvic9@mailbox.org,
	tsbogend@alpha.franken.de,
	v.georgiev@metrotek.ru,
	wangyuli@uniontech.com,
	wsa+renesas@sang-engineering.com,
	xeb@mail.ru
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various compliance requirements."
Date: Thu, 24 Oct 2024 12:57:08 +0300
Message-ID: <20241024095708.189649-1-isage.dna@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
References: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_025724_955290_4678A9A7 
X-CRM114-Status: UNSURE (   6.10  )
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


> I'm Finnish. Did you think I'd be *supporting* Russian
> aggression? Apparently it's not just lack of real news, it's lack of
> history knowledge too.

As an avid history lover, you've seem to forgot, that Finland fought on Nazi side.
So yeah, we're well aware you don't like Russians, unless they're in concentration camps.
Which is exactly what you do now: segragate, based on nationality. Strip of credits and names.
Once a nazi - always a nazi. So, fuck you.


