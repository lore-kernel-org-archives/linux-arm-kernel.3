Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3156CF8861
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YYwr6/m+b0XJm7ZWyrVETMWpVegAdWdXxk9Fmto5Bg=; b=CjJfvxbX7aWxAw7QPja82f+tdS
	QxnTOgvpHAwleNEp2VtQdOs+QP5nU5/MxgLlpWL6YoP60XW4hfZCXWSTZUOOBRtMlf9Bz9MTnYaCh
	qVnD4flxYppdOCGtTQF0OTKqAE/gCJdftSvHhr+5smXuRfibC5kXYZNwR4VCxGHs8G1I8BrbjUluf
	gwgNkMbRFWeJgatbE5cO7isIRtRgA3hqwM5HtEYaK1j012EMbPOpgGJAwZT9XwqFpb2TmB3fTbxD/
	OZOrmCqp4xNPnkE7lNFyx7BWOdB6QIkFllPvwZX+5xmnupwNtkDiubD1CeevKmy773x4f2RoaOiYs
	akhsNuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5of-00000006r95-2Yyt;
	Thu, 20 Nov 2025 14:39:21 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5oc-00000006r8c-4B7B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:39:20 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8a3eac7ca30so52682185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 06:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649557; x=1764254357; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1YYwr6/m+b0XJm7ZWyrVETMWpVegAdWdXxk9Fmto5Bg=;
        b=wo3fvAkJpaeKKCwfJqo2JkxbhqCfCeyA+seNkMggy2xRsiqvK5Qd0Vs/8H5TeloTx0
         oERoWBhKUzmhez5JHS9OKdSjL7hvqfotNYD3F8b/kWNEkXjsHOdvKJsmn5MIwwJQnhqB
         0r0aTApfIkVBoFgaxkOvn6nGtQB/R9slLud7wXCBJut3xzlw/fPwM1WcWbQFq3jRkpey
         aGPBj1urvWgWe07ya6CTpf6IiEPM8Q+5i8ALIeL1y7s2W9KvbBw9FdEpGMrXKORfuKhQ
         dI1fU710mY+7B0yahIhLopBRaFTElLxFzs1OW+MXdp1jkwtknxeKxcMuCDql9/Fpexw0
         ZZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649557; x=1764254357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YYwr6/m+b0XJm7ZWyrVETMWpVegAdWdXxk9Fmto5Bg=;
        b=aswekvf+2COUhe4JXbIyZjLjF0iup/02FhmfDDKBjElDRNYXQzwusyGSnZaN78IESW
         5N+Ua6yDtNrwEnEB+LCwFjRmQ11XRRknvt1pbrD9Aa2kzLQI8tp4y+Qf4qTc+Bi8Rmx1
         GPuzfW0DGPATipMAkuusmEPXC2bVjqWmpeBd8Z78eVVXVX8kPm4DEl65ApMb59CJpfni
         FyssH9Nd2+9X+fSwQh7VtmiPLN7K1ku7afE9hH18KSK3PDiXfVLKzBwgk0zSZ9sOVYRo
         KdpaN1wwu+4JWV5Wm/9e8E3NAd9NaeuKEM/c4i25mZnKhem1lUGtoAtP3oR6fp2ACegt
         5LAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqfWoS+xxFQ1AXu/PRsSVbPOdGl98ZZqnmUKUuqE5HdY3axEqFoewEBatkjnowMD5m/A60OxPfXfZw/PvldUov@lists.infradead.org
X-Gm-Message-State: AOJu0YyqDe1fJVPnRhOs6vfQ8evt98wjRIgkL2ds901vKX/wLuz/fvzf
	bTVvZR2i0M5pjQEmEKYc+JM2qq9Em6N7v9mjbVWaZWnAIKC5oK3C+6Fp+PqvvWHxIL0qRKlJPpg
	FXcYc3AhLrnQTxCSJZnA5IjO89csKXEVZPoA51pz2Lg==
X-Gm-Gg: ASbGnctdgLfh2O0+7vAbwsVjaJyHyuMhQWbxe+j4pDcAEya2VHcSCBVWB+mNjZBOryv
	ktoqc3Z6PR4/F35t/aeQ7lt0VTahKH50PlET/APS/x8NLgm0Kk5ZY3VVaVe2Bhx5CCOZpbpdZ2c
	NMeDyBVdSBxSDnHhYitgDG/J7Q308dqvrrXUvm+ItjmhHm5XnNy4QgtLRVQG8TsM4vMGriOM5z3
	4XYkZ4m0WVuLZgNxfJSnfGa521doW7PsaQMG3ldc3Aiy16K7McLbS+0flr1XiJrbON+FAsdhHwr
	IsMPXzlhoke9BvyIaqMB9dvdO3c1
X-Google-Smtp-Source: AGHT+IE/cYHjwh32MRdltB28T2tJfN1f0Ft40ID0C4cRQVP34kZKhQiUHkvPg/zZ8LIUS1orCjlgHUCSDffLbt6pAO8=
X-Received: by 2002:a05:620a:179f:b0:8a3:cd9e:e40e with SMTP id
 af79cd13be357-8b32749aedcmr396458285a.86.1763649557337; Thu, 20 Nov 2025
 06:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org> <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
 <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org> <20251120141821.GA724103@e132581.arm.com>
 <20251120142520.GB724103@e132581.arm.com>
In-Reply-To: <20251120142520.GB724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 14:39:06 +0000
X-Gm-Features: AWmQ_bkldnJdoOcwmqeUFrf-9arSuuMXBjA2pwzRXHnuYEEP3hoN9Iyvci9YeZk
Message-ID: <CAJ9a7VgcZP_Ck=ZJrHBi3uffYk-DNC=MV0q3CoAm2twrsoCgvA@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] coresight: Refactor etm4_config_timestamp_event()
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_063919_038896_404C8967 
X-CRM114-Status: GOOD (  11.75  )
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

Hi Leo,

On Thu, 20 Nov 2025 at 14:25, Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Nov 20, 2025 at 02:18:21PM +0000, Coresight ML wrote:
>
> [...]
>
> > Maybe define a general macro but with extra checking:
> >
> >   #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
> >
> >   #define ETM4_RS_SEL_EVENT(paired, sel) ({  \
> >       if (paired)                            \
> >           assert(!(sel & ~GENMASK(3, 0)));   \
> >       else                                   \
> >           assert(!(sel & ~GENMASK(4, 0)));   \
> >       FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,  \
> >                  ((paird << 7) | sel));      \
> >   })
>
> It'd be better to use BUILD_BUG_ON() instead of assert().

That is a decent option - except I would have ETM4_RS_SEL_EVENT(mask,
paired, sel) - so it can be used for every register that has the form
<REGNAME>_<EVENTFIEILD>_MASK

It is slightly vulnerable though if someone passes something that is
not 1/0 for paired - which is why I preferred the two separate macros.

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

