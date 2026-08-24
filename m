Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ADCC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=He6RFHl6rq/FSWjt0HcY9MKwV1uNr7NSbctKQDp7TZo=; b=O1f6OhypBixvvz0pU4pN81SUPI
	5epqdVuR2X/K5uhld/LpjzwvJfifDumalyPhsN20q9N17mQD5FJIX3RvAvA5a3gFyKN+8KmysOn8q
	i2gTq/cbHlU3S9SIeTDMSWSn6IetG0uyIOe5RQpUuUY63MpTkSCYJQ2eaTVCYxWaKTLcZX00A7xDh
	kLiWbrP3oApHVq2XP+ZNl1lPQp47zKzQ9TTCxouW0jmXK94iMA6WybnA/HbpK1nulN5jxhoVK+HvY
	SKcr3KUJeYzceC9PdvZmBWv8wmVQ0iS1P+mtq6axtvNDNGLbcRH4NuI8konsecxheR+HLKcF2Am1X
	T90bB6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWVV-0000000GuX4-1SOE;
	Mon, 24 Aug 2026 15:22:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWVQ-0000000GuWI-3wnE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=He6RFHl6rq/FSWjt0HcY9MKwV1uNr7NSbctKQDp7TZo=;
	b=MW/GyNL0BCUbO9s8h5DZRO525c7oEv8qpvqeEUUejpk57p+O8Vk/ju4V4KL3wgAoS+sJZg
	dIovVGNr1OOolpRlFbxaniDQ8F48qpYQFfQCfp3GuSp63/+vM2hDSnKvPJ7//ECaqsQWPk
	zivuQwFIeRK4I52/ivuVt2T7WBu/eW0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-kKP4sjjwPBmRSKsrdDDj6w-1; Mon, 24 Aug 2026 11:22:34 -0400
X-MC-Unique: kKP4sjjwPBmRSKsrdDDj6w-1
X-Mimecast-MFC-AGG-ID: kKP4sjjwPBmRSKsrdDDj6w_1787584954
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef8249f871so37917426d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584954; x=1788189754;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=He6RFHl6rq/FSWjt0HcY9MKwV1uNr7NSbctKQDp7TZo=;
        b=Kl0SzjZRTJJLOLPAK0YgiT+7nTCFgQv2NpvrU0k+G/HIhwlauQA7L9BNQBFDHBpDXQ
         NOuna+ISRltrjJf5Y1OllL7DKaRwqscdA0ytNlTB51lcT5yMpNZTTLJQ7J+WGhmIXRlW
         oV5caqjTdbxz4+knYMJWkFY+cwzeyVziyzgN/ZXIBnZ10txArJfZ77KNWhBnNmNO3EGI
         vc8dFxYNHAsaaejDoTaX9uwwXPLa5ZFRXU6GIbswdGXC2sKiq6GIBYUOEl+0N4kkBNmg
         hH1+9YjrJtapon9hxSG8cJIQmw66NuFTihWYBrVui5PvdEd5xdVg1/2S5BV2zdrlT8ac
         bTAA==
X-Forwarded-Encrypted: i=1; AHgh+RqixrYh4wq74ruSIaMJ5feXIbeDVg8z/Ecrt5cUgRy6muY8EBhRaC33S5WsWbrCmhohbm5ZviOU9g8MuZmlDxPJ@lists.infradead.org
X-Gm-Message-State: AFuF++n6OKSfUTypW9iDP0rdP5aq2bYv1vrq13DvU7c+Gko7zH0jkpex
	5apMJu6GEw4cIUmfQPs+EsH99IAYqVwPcxBDVwc4hXPxT6dHijQelIAandFm1BDHqnskz4SGJjN
	eOmIoEZbSdnUuToaJKE43qxcojGC0u/xTEtQZLRCAUs0/Xu/Tzk0vXTAUY2Az99OxzoM6iAMILb
	25
X-Gm-Gg: AR+sD10XGya0adqEM3P7VNAuy4QAYDyc4ssALS69dTRtZtQs4Lweh8m+zc7DosNE478
	kbsrnlmJD0unea0UBEfj03TUWWzAbV2hegJKlfSAx89v/vdeLkjZdHi7KQDhX9sU1JMQbV23q5Y
	QhoCRVfjQYOsixyxNEDrdmd9rSjGBTeSNEgwLgaNM3vuIROYYjmVwGVXa86Nbd9oGfG1V3cT2K2
	tv+IR92T/UwgACJKWmj3aKBlYWM0+xmyoXaPBG1Y5BIiYBNgSHKPAv5uk4RvXgRfaaS76kio/Ai
	qwtpsVbhR30fOXR2e9uafy7i2Vqg7dSriyTaUI6lG8PVgzKhPA82LeNcxKIj1wxZ6C9ttLC9mDT
	nTLOjie+ZEsPNaYTKrNVsqgcjNWJrcQaR8VI=
X-Received: by 2002:ad4:5c89:0:b0:908:3e1c:647f with SMTP id 6a1803df08f44-90c8fa9093emr222737206d6.32.1787584953847;
        Mon, 24 Aug 2026 08:22:33 -0700 (PDT)
X-Received: by 2002:ad4:5c89:0:b0:908:3e1c:647f with SMTP id 6a1803df08f44-90c8fa9093emr222736316d6.32.1787584953292;
        Mon, 24 Aug 2026 08:22:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93619bbcsm64952496d6.20.2026.08.24.08.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:22:32 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:22:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michal Simek <michal.simek@amd.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] mmc: meson-gx: FIXME: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxhtzBk0SH7D8hQ@redhat.com>
References: <cover.1787240090.git.geert+renesas@glider.be>
 <4b9a377a810b69a4eb885fc00cb34ef63e7fc1f1.1787240090.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <4b9a377a810b69a4eb885fc00cb34ef63e7fc1f1.1787240090.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CUjr0sWrYyY_Xa-vRZafWtBqv1Txuk0J8ITBo8R32ek_1787584954
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082237_055886_DF2940EA 
X-CRM114-Status: GOOD (  13.79  )
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

On Fri, Aug 21, 2026 at 12:06:03PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

It looks like the FIXME should be dropped in the commit title? With that
dropped:

Reviewed-by: Brian Masney <bmasney@redhat.com>


