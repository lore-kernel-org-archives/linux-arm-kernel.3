Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C074C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3RzlGFhAvuM0cuDF00eJyPgemDXX9EL9Mn84ikQ4pw=; b=jItjtkeBiepF55XaaD4bNgSdJ7
	BZeHzc++ICMMQOE7TP7jpKH7vzJh3Emri3ehjkeCUaDMBmTiIPCnWJNk+fw6aRKvyWG5Pnm22dHoj
	mhUr8pDohDNrF6bwQLN5RoT7LEqO3jEXa+kky3bw06/D9n2R06dLUp/KUsAbGSYg8YMLCKJv9TJbJ
	qQGlgwYyTGtUMlFYClg3pwSp7XbmRA/H57Xis9nvhOmuHSBdU/O+XANYKuFmn7SrKFI5kIgcfLifO
	MJcDnZQqz6KWUqwtS2Qr5ozE9jHPhIJ2R4YlWZ8ZyC9ctfYoDk2iBpkC9f436/PT+susfTbv1jMjB
	5YCB2Bkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhgv-00000003auA-1xWw;
	Mon, 10 Mar 2025 18:17:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trheX-00000003aOJ-3lZ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 18:15:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43bc63876f1so39262385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 11:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741630500; x=1742235300; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3RzlGFhAvuM0cuDF00eJyPgemDXX9EL9Mn84ikQ4pw=;
        b=q2E4OhQzvXJX645UbMXUDtAJt4MSAxguQua3cexn1EV/dbRpijAP6S63cuL3BFl3Lj
         QKIhEJl7Vr6e37Le7pOMqDzirh8Ts9g5rBldD9nZh7Q25hREROhHBmml8KfRxAiZoi3o
         Pt3ZGnCR2Y0f08ouiYnNIt5CZz59CQVDu9vCRXzYuSYXzWX9tA056XO6fBUBD8ghL7/O
         Su+5qRQa3xkI3Pv0jOxCXtmvralkmU++fP7pxTeYQocg2MyxgZzS/tWo82mKNNXANssw
         ebj5GIIo2wP0SQ+cM/ym3+y7lXVDgLuPW8TDkv+0v21v9CQQ1lAgmA4hzflLsWmf2LfL
         HDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741630500; x=1742235300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3RzlGFhAvuM0cuDF00eJyPgemDXX9EL9Mn84ikQ4pw=;
        b=lEQoC8m890wrLeXM7s2W+K7a29KF2vxcfICSi9L5+Ne313Kc1Q0aOYSBR45gAKOulB
         SvrbAw1bhX4P/DOZC6vi/eQi2KBUyS5n/CPlJVj2n95sa6MlwT2qwiam2iHJcGZ11ZMZ
         jcZ6VpB3S4vUxjAAAmbmwx3s7obpN9VP29u+YXHENIQsmeb5XyU19g5yaXnBI1oX9iv8
         +28ZvlFAarOeAsew0AdnvqqeU/Cw5cIcLbY/4C4Q0prSztKqMs0YID4mrSkDlw+OaABH
         4PlVLOpNEyIIvU+9Kb9BWRje3Yr3jDsYyj5ooWC6pp0N3Xh3ZfWAcclHBgLCVbXR93td
         4GPg==
X-Forwarded-Encrypted: i=1; AJvYcCUdY3eZHvfXp4uSJbVFnGms2xU5slZmGcBw55QAZsGV35kkYTKWoucZAOT6dMPJjZGe8qNnuVowmcyWrz64TmHb@lists.infradead.org
X-Gm-Message-State: AOJu0YxEpsIbciH30KYZqypON4+zQfiZ4zZKSvabCkHoiIFzewyx06dg
	eSzjG4e8VHgriU0rMva1ANzSmVXM8LZx0xxWWnJpL87ra1ZbWECGcE+nj3K3xLI=
X-Gm-Gg: ASbGncs3wuoKTJC3tviNxsXaNh2Slv/aq9yZ3/ULVBwhIZFxYKIKZjShnfnRME/ZGVV
	QQLHNyXulfTSAkJr9L9k/1UAMmT5OgeWldZjpYVPA85RyvlhVrWuViXPObCQ0nRKFm9hqtkZR3m
	VInbbctd8123DPtMOOwntGkSgz0Dr9SGCugx3KMvvtHTtLGD1ewNkozIdr1qCkb20pU8B9KaxAW
	Fg5TrfSkkwvsZoDTMC5bGzEUZjErj7oCOJsrWC7oluKBn2vYOJOlZXSvLwkfZFaI5syJAAZ+v+i
	DNSzA0DnkjS22CmGgNHvnXAxlqPoEC1J/uyjk3sT+BUxsh6CMZ15blB6hmk5
X-Google-Smtp-Source: AGHT+IFt3w/t0krndV7nu2YZ6CAjcoMbnNHYnSPvnNwZG4aH7mpi4yFNuonaavUpPD2h5koG09zTWw==
X-Received: by 2002:a05:600c:3b21:b0:43c:fee3:2bce with SMTP id 5b1f17b1804b1-43cfee32d16mr19567085e9.26.1741630500212;
        Mon, 10 Mar 2025 11:15:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43cf7b88494sm45446875e9.0.2025.03.10.11.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 11:14:59 -0700 (PDT)
Date: Mon, 10 Mar 2025 21:14:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq_arm: Don't use %pK through printk
Message-ID: <eb4eeb0c-7cdd-44b6-a9bb-11133ff55925@stanley.mountain>
References: <20250310-restricted-pointers-vchiq_arm-v1-1-dd04f208ee55@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310-restricted-pointers-vchiq_arm-v1-1-dd04f208ee55@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_111501_942241_8C25C58C 
X-CRM114-Status: UNSURE (   9.28  )
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

On Mon, Mar 10, 2025 at 04:53:33PM +0100, Thomas Weißschuh wrote:
> @@ -2003,7 +2003,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
>  
>  	if (((unsigned long)header & VCHIQ_SLOT_MASK) +
>  	    calc_stride(size) > VCHIQ_SLOT_SIZE) {
> -		dev_err(state->dev, "core: header %pK (msgid %x) - size %x too big for slot\n",
> +		dev_err(state->dev, "core: header %K (msgid %x) - size %x too big for slot\n",
                                                   ^^
You deleted the wrong character here.  :P

regards,
dan carpenter


