Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106EFC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNqonM4UVtrsALbVQxE7BjqrmBap83H9yb8p9qwz7o4=; b=TwViUaonakWRkuYq5UDsdSznfF
	AChTe3glZIIxf9z/f5bUiiE8qImPpV2GCysuOrwSI0wad32tyu0FvXrXOubgJSqbZIorhaS4/I4Vu
	1bIgrTZuudzNhreMIDgnbQN5hOhRjUlh4fmJXpd6r4v5JdezQ0jVSZJsa0LVY5qGP3eyIxJjTcYKO
	iTSB8FRVfQ7SMSVV5i23oq4QpAIfU4t8UAj01moRKYjJMeVEpKWsJR4nPBp0WkOWLURAnjW19zdFN
	LijxFAPpVtGyzSgg81OlTKVrOvNusEhOpU5gRbCHjJpSGNSosq5JHtfC98HpNBiEd3ytreLa1Dlty
	w0jR7Ozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEO5-0000000EzDt-2YYn;
	Fri, 11 Jul 2025 14:06:05 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEGl-0000000EyAi-1YdW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:58:32 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b1fd59851baso1616432a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752242310; x=1752847110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNqonM4UVtrsALbVQxE7BjqrmBap83H9yb8p9qwz7o4=;
        b=ZId2HdrZIXmC9CAbUHVa/iQclWf0cHCNGOJh5ZN+H3udJra0fiMgdWy6Le5wJr3i9L
         qF98i4AI/4k6i2s0hDRDeaXE2y4l2hWYA26t7Wm8rBEh/+SRWuhpu7mkax/8NpZ3E6Am
         rnYgUcHB702/YFVQXB2gTn0Z7y1qPJorz1oA0ZdBlA7MClpGtNQOnYULIN5yH9qnsqja
         T84WU20Nzx9Rl0g87A4zIoAbXFaaghgMqg+rEdkxAWReDkhLN+2W75QuN46K+JdU2nbL
         5SaXcc6ww4aCn0rv5RLxMNHUXfGp5lDnp3Ydofb86fwPADqXw4dYXQ8d2IEbk/rFV44n
         BNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242310; x=1752847110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNqonM4UVtrsALbVQxE7BjqrmBap83H9yb8p9qwz7o4=;
        b=BEfAPLmvvLdpcQA58ufKCbugDDsI8rIu8a7MJ3fY2AAyx9wcQgQRt6HUOJhX0QhTaC
         WdKnEnWEDFCv4yYB1d6o+TodtBJqaYUXNwbqMqvcSixvtVK+1mh/U0vg3rKc1YImjgnC
         9sYUFyey9BwG2Eai/fX7j/SnuQlWm06cb7I8pZL5P1KlC45OQ5F9TeOKK7sFjQo470Me
         /rB71QT2y9Dkhs9XngWw0LOcCq28co7yknRgwCbgxzYhlr5agryqyf+zLEE1SCJpkAhs
         z8An9Zn4QaU3n85OyFNXgugO8raw6HRmhmFpGXsgD4BwSSOiY9Fb+TA+mbgh6QdpSH28
         eFEA==
X-Forwarded-Encrypted: i=1; AJvYcCUN5zG8qm4030+H6+Vlg8JAvwSB9/7KSAG7fPRvzAEyre3HDmjrKZBEeRZl6jxHWIRq0CXErisiJ3F2X425QpWx@lists.infradead.org
X-Gm-Message-State: AOJu0YxA/YjbxNl0O5GvJAL47SBy4N+pnpcYaqvDgXlxLsxjq+JCaxwz
	zbQLWY7N9whLuIMR8TqGq6zlwZ3DKmWnN5ySuGpbRWOfIOSZTTNsI+GHVY8BzizJRmUWJ7kRfEp
	jXwEoiZziLNa5/kbPX0APhmwLFIhYwLUYEQla7xE3
X-Gm-Gg: ASbGnctZnU/MJeZIFZZDf5HRY+jGsH+GL3mlWAlNe4wo/2vHECiHWDqZJIhKMEztrWD
	1mghhZ4TJEjIxf15zDgtiJoMnClhGCstGb5VzuYeXn3i6AFPCHcPWGDDBFi3QTAHU+bsFKJTB7e
	Y2NR24fOzEnDnK0MiPC42tzkAMP4iXrZU5I6uY7Lzn/kDGW3gRWtLnoKWhDvUmzQZnHf2SoFnUf
	9LT3ATF9nS3wRvQQ1cRSzU/wxjaYhEd1LmX3g0c
X-Google-Smtp-Source: AGHT+IF9vpsS88cqwJvceZ3AVWYOHULHoLV6jnQ0fxFPUTnJrLpeVWrilV12HX6w7fKkYy/KsZQkRWej43wmqe/0mho=
X-Received: by 2002:a17:90b:33c2:b0:313:2754:5910 with SMTP id
 98e67ed59e1d1-31c4cb8aa2dmr5577396a91.15.1752242308018; Fri, 11 Jul 2025
 06:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250711082441.4193295-1-verhaegen@google.com> <aHEEu1eSSGRhITmW@vaman>
In-Reply-To: <aHEEu1eSSGRhITmW@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Fri, 11 Jul 2025 14:58:01 +0100
X-Gm-Features: Ac12FXwkr5vfJuzXyUzX28ecPpQ4ARo3qP5rhcHUhMh4j4kcitfjBXfbRa88hKs
Message-ID: <CAAntYmKea1p=ao3OOWb=1Q+BXdyo1SCm9qGb_JMC5ry5DQVt-Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] ALSA: compress_offload: Add 64-bit safe timestamp API
To: Vinod Koul <vkoul@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_065831_408194_55DB4A15 
X-CRM114-Status: GOOD (  10.21  )
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

On Fri, 11 Jul 2025 at 13:34, Vinod Koul <vkoul@kernel.org> wrote:
> In your testing when did you observe the overflow condition?

I observed an overflow after ~3.1 hours.
I used a stream with bitrate =3D 3072 kbps.
So the field copied_total in struct snd_compr_tstamp
overflows after 4294967295=C3=B7(3072000/8)=C3=B760=C3=B760=3D ~3.10689 hou=
rs.

> Please share patches for tinycompress support too, we need those to test
> this

I didn't make changes to tinycompress. The overflow happens in the
kernel file compress_offload.c. As a test, I let it run for more than
3.1 hours and observed that the overflow no longer occurs.
The overflow is in
stream->runtime->total_bytes_transferred =3D tstamp->copied_total

