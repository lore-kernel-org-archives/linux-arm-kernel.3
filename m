Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BDFC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHfUzApUEKGymgCU0ibV0RvNyL8ndz/ADx0x3sfKtKE=; b=XHUBeElgczhVi2ePcnN70Mbj6i
	U9ugAYwPgPr3Uo0kjYuRhv4H3ZCErT1N6z+JJuxDEjC9Jhjsz09Dx6Za8Xht3A55OodeGadIXI/yn
	BZIfeb3XTfy60pzwGkY+U8IUKQG9TADFww1eD9UGtfg8ElPMXK/gnKSyRY+3O+aeetGCUGgYPjuVS
	Z0hEVNUS8AQTpBQ88hxdbhyEp4KZi3uk2TnJxfLpUHTKNEZikIq6zi2n0q6FJukqOYkMgFHFuYqey
	FBzQOfqG60kfq1BKn9BEDTd+Jni3peZyRj0NtnoEztE8BfBhjRBfuAWHWt2O5+fGFImAFjAM9bY2h
	SkfQtFig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHNR-00000009nju-2qG7;
	Fri, 25 Jul 2025 12:18:17 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGyV-00000009l51-3d5d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:52:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23c8a5053c2so16961535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753444350; x=1754049150; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QHfUzApUEKGymgCU0ibV0RvNyL8ndz/ADx0x3sfKtKE=;
        b=G1gIXIl8FYh9Vfcd1mYNP7u3TqIZ4EPfeMbDWpUJm8KZxPMGlU3D+CQsgHAed4imya
         J+lAC1hDQcBlaQVrhemX/uwz0L6YIroThwElcmBgrPcDtbYpURO2Y4VWONJxnf5wfYs0
         uEORXXPPfwc/KS9Z8Z1qdv+MgbTEuDosb8mBXADwI4YktUwnOnHlpx5m3ZHLyan6oWjd
         FedwlCM5D6WdNcAKD2J0J5DME/tVYuIgmMdMplLIBFfOy2nSsPp2ZAEwuZ323nzYPtCq
         U4e3szC5T4+Jf0pCIUUsBy8RCFpk/mDsgxJGRARQ7CHTa/TLOnQBnaHyCWtzJyDq2vCn
         Y++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444350; x=1754049150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHfUzApUEKGymgCU0ibV0RvNyL8ndz/ADx0x3sfKtKE=;
        b=SE8QIU23v7Hn06Jaeu8SW2Ui8hr+tM4u1F59s0LTtReBoKuoSdvI33MbY7bQTdTuBR
         Sx84BV09ppM3zgoVHM37qz3ijvequWw35JYWeU7Z81o0hp8N5tkmvEn3ktQ5ENdTMhlY
         L4lrHog8l83S9UVUNdwFVGsI067tcNrwLJ2VbEloIrZi/P/xvu5c1zRe9ac7O57qCyNR
         edin4syOa+Dehu77HWiUd5Ko/e+pJlHWAtI6LZ7I3C5GyQRRZ4T8hDyvebSRCk8ShDQm
         bx6faE7tmLnobOQmt1tgn5Z3V91C5VDjUa57pD/0HLJuvtbBuURgSsD7hdfrflXY4oQl
         qTkg==
X-Forwarded-Encrypted: i=1; AJvYcCVjp/Y5jiC6n5W6eJAgT+DQDISS0+0OVVTg8Ss7+KRP8MPcQP2rL43e+DvvbBGVk6S3t9gLzIqLsAPrhtTKW901@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzisy+vJZ8sCGNNHxeQ0YfPTa8sLiEzjPZlp1vvPkETGGf6GM3
	H4HOdMukzf2vElFjKmebK+yqh7DDEE17t+maHUpIGoIgwSoVt4ird2MHvNn1OGCOdFFK0bJnblR
	j7OMqGNfOyxuYpHaLM99nB9gFJ59rXarbaftqKLfq
X-Gm-Gg: ASbGncsNeCrmfr0CbGjRVG3Ha5ZnkEx3xOM6rD8MmMlheBO1jWIGAx8thWuCod27x0b
	pd4PbhrRD32DCoAzSIVwGXfdCdchpeaTgjK6kOXvtljjeQ+1kEzJVIwLrM8tCMNUeyrYIfLg+06
	wBB5AIXlgk1ebxDHlMRyaE+K4nog2GDPbGBoPo5xfGkX4l3Cn5uYiXs+A0SGwYCZyCr+jALnG9x
	phgllezIyPs5e0raB79w4Z8KRX7WU8QGqbtWqzAhLTp4JVfnAY=
X-Google-Smtp-Source: AGHT+IG5GfmK3MrOBGZHbuRXhEHK6RPABvTMzdf8n43yLckQ5vo4Q8NkC5md2ykU1zeemIwnNM0VGxJVKLMifYpsCx8=
X-Received: by 2002:a17:902:ea0e:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23fb3167767mr23036425ad.44.1753444349904; Fri, 25 Jul 2025
 04:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250711082441.4193295-1-verhaegen@google.com>
 <aHEEu1eSSGRhITmW@vaman> <CAAntYmKea1p=ao3OOWb=1Q+BXdyo1SCm9qGb_JMC5ry5DQVt-Q@mail.gmail.com>
 <aHZLvVnNiBcqXdXG@vaman>
In-Reply-To: <aHZLvVnNiBcqXdXG@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Fri, 25 Jul 2025 12:52:01 +0100
X-Gm-Features: Ac12FXyZSuRHRd-IFK6__wpasUMXKZCQVkzaxu6X84fGcQfro1hcT6PjZAqbpBc
Message-ID: <CAAntYmLn28XD=Zc2ZeCnhEiUuoa9iq-W9EiK2QXY5YfYcsi0cw@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_045231_902688_AADA6E5F 
X-CRM114-Status: UNSURE (   8.13  )
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

On Tue, 15 Jul 2025 at 13:38, Vinod Koul <vkoul@kernel.org> wrote:
> You need to add support for new ioctl in tinycompress too

Thanks, created pull request at
https://github.com/alsa-project/tinycompress/pull/29

