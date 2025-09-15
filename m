Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED65CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEX9XijT6dZdXfDNPrPyYoF9pF2to+I4KU0mZQv7Zoo=; b=fUTYMUVEeE5viI28FnnR0fuYc3
	oOhwRbBo/qJJAbj3JSPGrOr78sJVvkctnJmyFNrFQGl3MVK4Vmlf5+2Ci4+NXFO7AYE8e8dYE+EBi
	oPDoC/T3k8++JqrXwA5Ai2kDA8H1dr5baH7Rse0Yf4MyanVhbTzMClwGS/lEtU0lgro3cuWNenA6a
	yUUR2Eiir36Y7aetfh8BcGrX0sRCykBNPCz5B9+oij2Dmgvc5kblz78+KTznju2aikKFmfMCcm5Kp
	ApX2qkKveml2lXgcvaRxXRMeo4V+wt7ACNn0MCiPDD3DLYoNxhMC/ZBGkZjNa345IBTjPqydYQoYp
	CgfHT/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4kd-00000003Fmr-0FHS;
	Mon, 15 Sep 2025 08:39:55 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4ka-00000003FmW-2xBi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:39:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7762021c574so1680820b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757925591; x=1758530391; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jEX9XijT6dZdXfDNPrPyYoF9pF2to+I4KU0mZQv7Zoo=;
        b=U8ZSjIQSBPaj92RquSKRPtFVHrMoKfRBHG368GUV87rbZv6eH4Gda315v6CBIguAMh
         AiZPFZo7y7ic6d5oWe3zWb2sem4n4LQyXZeKivykUakJS/EO/qZnkJxel0SLkKek+E0D
         nKMKR4Bdnx78rRs1AtAJUPgZQ9/+TrM2H2qPNgVDuGgFbhF4URuSQNd64GdbhPQdF/Oa
         X4oy2tAzjzR2AgCKuitfA4RzM01t+ay4T5uAVznvkVYZ3loJB99Zru1//QyeCi39pUIW
         1Khqwv0uJ5PJK31WdzK32yla9CRLZXVw4xWfJJf7LcJgkAl93CJNm5KpBxST8A/bMFn7
         cp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925591; x=1758530391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEX9XijT6dZdXfDNPrPyYoF9pF2to+I4KU0mZQv7Zoo=;
        b=t7OhqKnFJOHAQoQsDqodkAjq/CFdpBp11826Ujz8xbaFA6aYsfdIGdGFS2NHOwT0ik
         wt5FPa5zN8Q13mG4UYP5WhsSNOP6Pngj6UqaHV2cZg2eKOjSC+9ZVL0jb2rqHrS6eSPp
         n2IowCSrL643Y6ESGpKZQlMsNTeO7tCwwlkxhm8Cmi4rOB2bw0fIdQYIt0fO//m8wodI
         z7vwStehcabb6Mf0RKJ8HuHXR0fhkaoQntkuInXiafOh/2CvyEVC8DjfuN+vlwIX5Fpv
         v+eD1jMHImh3ZMFhLJCJjPWjr46/kNn8mARpnSZUi8H5j7grWwJzwcVGkPsOT+lw+4Ix
         eGYw==
X-Forwarded-Encrypted: i=1; AJvYcCV+5vp5hHrCao/H4A+CNNUjc94h8HcaC3XDpuMsSShCAHX7yjhHgUakyiGtKNAicxscW1n+ukypawhn8HeNX07y@lists.infradead.org
X-Gm-Message-State: AOJu0YyNgb6PgBLWEwj2H+jxpj8k+7FDJ4Vgc0191jhTfDpf8cPa+ujV
	WPUqpUHeCMURStMBKgYe2Ux+rNp+kExhLeOZL3Zt0CxzpC+tQ5oiR7T4NrvP6kwVxMof5XTJF3J
	TKumMS7ablhcpvQu9UOPNhcXVkYZnXgDc8d+UQL95
X-Gm-Gg: ASbGncst7rGZLs9XtJsbyu/dppvBMBj6P1pE5xe5dTATd+Z3xpNRopG6XVAIqUi6vhr
	pUv4e7Hzp9BjzQeb554gd4RARcm8yOFbrj6JOL6FYIgR0uHPnEkORGlUPotLxQoa9ngnnzryfHS
	n0IJp8V6+nOSpzgBck69o/uJ6sqbJKJoqEVfSDqqG1f55QGA1Z44gxL0mlsRgstW3WxCS6sw4vZ
	0GWkKr4Ycn3U9YBdpXqOIBvevpw4LB+JV4rvp62Ww==
X-Google-Smtp-Source: AGHT+IFQWa1Lq5s3wHqivhZWy3fXCUWg+0nXwEU0qlOA4xFoXSjxKquMoaAEWKKfO/WgYI37H9Hf7stft0DUGFXxn+A=
X-Received: by 2002:a17:902:ebc5:b0:256:3dfa:1c98 with SMTP id
 d9443c01a7336-25d23e13e2emr141646225ad.11.1757925590740; Mon, 15 Sep 2025
 01:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250905091301.2711705-1-verhaegen@google.com> <aL5t33Ztwse6HoQP@vaman>
In-Reply-To: <aL5t33Ztwse6HoQP@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Mon, 15 Sep 2025 09:39:23 +0100
X-Gm-Features: Ac12FXwunFCBoJSIg5TZc6taVzPDODNO9kbuJ_l3vtZMfjpWrOJmHmPUWle_GzA
Message-ID: <CAAntYmJbFo+PZGVamNYjOav03UrZ0i6a6fMiRdfTJ=LgsHiCZQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] ALSA: compress_offload: Add 64-bit safe timestamp API
To: Vinod Koul <vkoul@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20250915_013952_741769_A127096F 
X-CRM114-Status: UNSURE (   8.25  )
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

On Mon, 8 Sept 2025 at 06:47, Vinod Koul <vkoul@kernel.org> wrote:
> Please updated tinycompress changes with this once this is picked up by
> Takashi-san

For reference, link to pull request:
https://github.com/alsa-project/tinycompress/pull/29

Thanks,
  Joris (George)

