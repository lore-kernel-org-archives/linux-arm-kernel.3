Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB67C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 03:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=; b=RirdwZ+CyVc6XcYBMzcSykqHg8
	0ENt/K0q0T2y7V0aAfpKTQZk8A8SEUzRw1SUNuCZ7iQnzkKKQAve1aQ+p+L9Ow8PZzXNjNM/mds0h
	yqpyE0+zF7MdVJ4p/MsLCJPj63D5LHMxBImrMHMmzkQ3RsMYYNpI1L/bSO/uXJ+q3yFm2jK0otrSn
	z3O9wjogn1z9R/zzt5eR8/4g0qfCA23sHKpMxXcMzkeL3IHtw9jIMrveQdk3AeE54J/UerhJvrEBY
	OX7ktFS9ym+E8yym1P5DdZIrLeXURoBEX/q9LWSuc4tGhLxmRqlXNYQ77qNFEu2N5sFsgDmhgqcoD
	r1aFZ8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rVa-0000000FkDC-084v;
	Fri, 11 Sep 2026 03:00:58 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rVX-0000000FkCR-1iEk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 03:00:56 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-853c07a76adso466650b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 20:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789095654; cv=none;
        d=google.com; s=arc-20260327;
        b=WJtlRqMsAmH96o6/peuE0W3cT6onycHmMUtLhDJPOP92KCzHzRs+RWyIwM8lel0yvI
         APaMG0SplVeEBDNQktS/sm6vyzfZF3Nlw0/rNRdXYP1KHWQJBSBKcYK5zbqubizYzpU9
         m4GnBgYOfOYtYGgCzzNjU38W+QKZL2YFQjqDtSiQczD3sOh3c0PxmllPNLmZaD8M1XQ3
         Jaqo2wyjJpBNBGjRimIU1xxhz2DTL0PrOBih4x3P0jiqMdT5EXejHePI2Rb0ccZCfbXc
         W+9BTlv7zV1GE28FfuTKu4qUDHnqiu46eSaYFpT6UKuCC4dcwDRbLaRmF5Mfu9teT8EH
         r3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        fh=EtVkFX5w+Tseo+fDvqeW7dQ4C9Z5rzlv5KbwLN02dow=;
        b=iaEVSD7MWAaX7icXuUru0fZhknT0FbrIWVYHD2/rZLp2w61Blm24+YKg+t9IXzirj7
         AsC+wrfesHbM4vN6fIjoU5jeKHnIMmei9euxOG1muIIOy3MOggqMoaaH7/CKsHyCe3JQ
         o4fnt060T2ak50e9h9cWMq7j3AJFMfihKs1eaNBthtZ92gj3B2HMnS2eit1i2e/Zeptf
         La95rhIt8O+xXBHQ2pfEKxnQEydHGdJHhAcxhZiwtd9SdkcFLLmiR3AvFvs9xrnrHYrX
         EbARdw5MIx1MbzaJCeM2vS5r0CprWJgo7wjJyDzXd3B1Cb1nBq9/1y90evE1VpCPZQER
         X44w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095654; x=1789700454; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        b=Alf6uNm4PM6p3A1D5giTn5epwxBlcS5cztzN4f37y2rr46n4RfV0GKpKGXsxrQkIWd
         cN2EmArxZfjgDppxzGImiWJBCJw2uvADCdPWLFztAg8MBpL4nju+2kn6yEjoPhb5McxB
         BTS5gjUqTNt6fExUudBSWNs7dPefoG9myC51laI9uFK3q4etT/jzXJY1iF5bWfJbtmjE
         pg9RPmQm3wJNIAciH9zjFck+y8CLQi+MUyNKicOQyccauGGE4S+ZkbNd8sIccq18ciPS
         l0dM7dTAiibcmamR3/lgjPOjl1NxVcOGDhEf6F+NzeZUvvxFAyKobnY/qAVXafNIxKzV
         cLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095654; x=1789700454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        b=hDe9UDoDxhLnZUA5qaCe5jBVbekJzuiNcYgann+Wph8vLtHutF8pkAhtQsdj8OKIQr
         VdRIiuwsJSKw6KlH/wkxKoz8Pkl3I3wwEqFniwiDT+lqIyyjgdsCkkgUexUv5rG2IAjh
         LKn2DVonjyGjFgGxrGdL3H0KIG66B1IoefjXargn/vzygQOLImvBljZ3XzRmDTWm4qus
         8Wz1dt/uiKcvTOHe0tJmjtUkvKJTJlTaTjAwZd/+F3nEJ46fqNnINhUr8n58C2xhaTy0
         urnOW0m4UyE+RqVpBYxQD4YpbN/i5kcox4oC7SyXYfK99exO1JxzI9IN4iycGE33tkpk
         FYpA==
X-Forwarded-Encrypted: i=1; AKwUvBx6Oq9UBmESvpCYtgmFCK0DqcX7Y+Hh7PUbA7mkR0XdELfjnY3QXGpIrHOFmXTBd/X7cQ5jR+0yT/rUY/3Z26Q3@lists.infradead.org
X-Gm-Message-State: AFuF++myeW/uAlub5c66TJUbPWh8HLPS2jf1jHt6mi3mJtw8EaCZSltQ
	z8hRKTjiDOSo4srYBiE6487yxvtL/3pLT5vjs6ayLhT5v5UKZgPviS+lJVKZj6Q4jL6ol2hVwGX
	rq4Ajbq3QTjLRa4bdlD9cNtVL3G6cFTI=
X-Gm-Gg: AYBFou0CeHpfumVwT/H4C823XjrIInrEWaWAZZ54huuJ8AMIHLkTK9LUTUXkO/xGg3g
	yQn8I7abwmehQX4PB/Yxt4xV402FU5eeMy3VXQ+0XF1nXnxMwSddD7N/0bmq3LW3sodKno9lqrL
	SR+y3qE72IzG9zfaCDIV1QIwA9wouQTLM+j4wW2Bu8c4k0jZQ8mCZvX+3B3z/FkDTuKqSrLFhxE
	gV6gqH8P5bN2/ojRAYzUTtSIo+NFTFQg+Ho3EYJ9GcMIk8xJVXDfayzRYCZMKJHL6XyzV8DZOPo
	h9rhOftjiwsOSNt4azcXPvUy8E1+BdveFN4ym6SyDNabb6jGaE0lmuEmIdcTUa83b5OnU14rIJ9
	gUkpYYkTJr4GjkEQLS2g4KH8D/Dw7tynsS/XEGCUio/syydD5BLJI1cwCAi0EUQ3/sAQ=
X-Received: by 2002:a05:6a00:3cd5:b0:857:72f8:dc99 with SMTP id
 d2e1a72fcca58-86b328e7f63mr3298126b3a.26.1789095651223; Thu, 10 Sep 2026
 20:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260910114338.142682-1-phucduc.bui@gmail.com> <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
In-Reply-To: <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 10:00:39 +0700
X-Gm-Features: AcwNN1WPfGjfjTJ3UBeJ1SZL5IZMV3aP3IQW-IHMbnVy8yqXjU0IzHMcAxwIYp0
Message-ID: <CAABR9nGdsKvay_3Cd_Lm0DjU6MiFL0zaC+ftpgQGaX3YtVe+DQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM errors
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Darren Ye <darren.ye@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_200055_478642_1E76CD8E 
X-CRM114-Status: GOOD (  13.81  )
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

Hi Mark,

Thank you for your review.

>
> mt8365-afe-pcm.c has:
>
>     {"HW_GAIN1_IN_CH1", "CONNSYS_I2S_CH1", "Hostless FM DL"},
>
> missing a Switch from the control.  I suspect there's other errors; this
> really needs to be tested before it can be applied.  Given the general
> quality of the driver here and the lack of anything constructive we're
> doing with the errors changes like this have high risk and low reward
> unless we're actually running the code.

I agree that these changes should ideally be tested on real hardware.
Unfortunately, I don't currently have any MTK boards available for
testing.

If these changes cannot be properly tested, I'm also fine with
dropping this patch.

On a related note: do MediaTek or other hardware vendors typically
provide development boards to independent upstream contributors for
testing purposes? It would make it much easier for contributors like
me to properly validate changes like this one.

Best regards,
Phuc

