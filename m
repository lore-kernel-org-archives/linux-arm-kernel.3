Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD40D59D7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 22:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGr05iKNJHbtHhaz6iDKZMDzd6vC++UBaPJYjmD+AfE=; b=KsXlHqsrrAvw4O9YsuKXlMdh1b
	jiKCPjTKwdXrxH4fZOZtwu3GdBpuBu4TzzCjW+KCjaPJR7vVzlGP7b2eShQ/EFlIHrUhwmYTzlBXJ
	t9XUuimduZQzDi1T+UGGHATv3ZByClmoZLW2hNFGKru39U9Txwv3LiXv10SHdhqkt9NC06jUWAGDz
	7YMSg63PyeVs+6Pb43rYW5oud1HG/UsHmlj1Hh/95N56/2c7K+Pswhadn24MrtNFG6UpEJ4OXcanb
	CUviwsaqzUS/D44AhMzkUbgjekn8dgOk2rJ4M+F6C3jzotOIX4pYWiB1IzobYCSbDX/WsoI74RQI8
	ff0pSWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFhKN-00000009Bq2-1sEr;
	Mon, 25 Nov 2024 22:13:07 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFhJQ-00000009Bjw-3i9K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 22:12:10 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6ef0c64d75cso15174047b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 14:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732572726; x=1733177526; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RGr05iKNJHbtHhaz6iDKZMDzd6vC++UBaPJYjmD+AfE=;
        b=xp0iHjv5ax4M+rL+m15/gxHuTNTOBOuzzmHZvJTuRenGsWADBgYdsfoDvcucSJKgw1
         st968g9YmzvaR++h/a63e/sP/lWI19iUqTxkpAeltzcl+EgZt5bgMAWsG0tgIZzuRN6R
         tToVqYqH2dyQBdu7aFGwdoXQeU6f4CVjhIMx/vZj/rVJnMtK2mDDWDQStWc/6gp7oNio
         ljXgTzhzsGPTa9Vg05Xmr0+pMQJnDGHJZUF9UoSe+gdOiZfyvZPpDwHfGjZHt8sNxCqs
         yFe3WBTKp55TUbMGE/xQtfnBenEXM+01R6kERbEujmhT15X+7/dJzCkZN85xx3l/ywjh
         E/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732572726; x=1733177526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGr05iKNJHbtHhaz6iDKZMDzd6vC++UBaPJYjmD+AfE=;
        b=CA7N1CoJn7IQntOE9XaYYR1d7eOoMxEj4vOky3w+t2hmb3GiV+valwuNtOMKPjSNJP
         +1J6qxMPGjKx/Jd1wi1XtmBP7IUQVLSijWvxxD1XOye8v6SYZhiy5hDXA0p8DDN6at2T
         XjHIaZWCak8/cln3m8Bsn2UmPZXDL25+T2m9xkMn6YoEfHrgYMPVc3Gt2Q/4JxCUmdL0
         mME8qwUgfzxjakUdOVd1ZrlhB8tnEYEkK3K66kwARIyGYhaeY5ngGg1/KVAhovNQimpR
         XoRs+emCkVRp9R5ANTPYFh0nVtGifyQXvOWg/ST6jf1nGhxUOjoCHXSAsgD7bqexkTZV
         wswA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ+v+gWW5gDqPqfW5hbf0D/JUrcVFIWgAVLgxbIGTxvRgcSYgpM2j/lLgtwdM5OnkKbdQklwxVzU7KZpp758kk@lists.infradead.org
X-Gm-Message-State: AOJu0YyjC3vltIaBCzIYwMV/fmEDhiXbv+2Dnn+bytgiD2Se4JD2DyPx
	adQk5bLs81xSVL3Un8QqpwKYLm5Ke0hLtWmEUD9C95TeXaB337HhKFvbmlUBNq3BsPSQ8Ko9j14
	m72sGqOvqqKBqPRN5hV1shvbGPlcRfP0ZsC71GQ==
X-Gm-Gg: ASbGncuoe9AF2JKUlM2tgNzTtoAEPaoNF83m6Zyb0mMSQUjvYDZMUl0LwHtw7eGARVV
	muufUDqQT03Z5zJjhP5+Vm2YmHlfPYKvGhP+lg0JpwR+hzw==
X-Google-Smtp-Source: AGHT+IHMeE1tMJvjhY7YlnbsGtnbHrVf2fxw1EomN6QywO8Yk7cLfG7wt01HeO53/ICqUTeaxSuJYhsdBLq9CwzcufI=
X-Received: by 2002:a05:690c:600e:b0:6ee:5068:74f7 with SMTP id
 00721157ae682-6eee08ba0c6mr132245527b3.23.1732572726501; Mon, 25 Nov 2024
 14:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-7-35252e3a51fe@quicinc.com>
 <mcvhfkh3ycrx2ganumsxlc7lx53ed55yk4syh5qev3jqqgkeqj@h5vnfpgjwtj5> <bfc87132-a63e-4f3f-99b7-1a1bd7eb60ce@quicinc.com>
In-Reply-To: <bfc87132-a63e-4f3f-99b7-1a1bd7eb60ce@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Nov 2024 00:11:55 +0200
Message-ID: <CAA8EJpoYwGHenThgxaKcapjTng3BchpbVBfzXqBvTDGBzv2J-w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] drm/msm/dsi: Add support for SM6150
To: fange zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_141208_936957_4B4B2FD0 
X-CRM114-Status: GOOD (  22.83  )
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

On Mon, 25 Nov 2024 at 04:31, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/11/22 18:10, Dmitry Baryshkov wrote:
> > On Fri, Nov 22, 2024 at 05:56:50PM +0800, Fange Zhang wrote:
> >> From: Li Liu <quic_lliu6@quicinc.com>
> >>
> >> Add support for DSI 2.3.1 (block used on SM6150).
> >>
> >> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> >> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 +++-
> >>   drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
> >>   2 files changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..fe02724bddf69c2e8d6816589f4ea410fa666e5b 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> @@ -171,7 +171,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
> >>      .num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> >>      .io_start = {
> >>              { 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
> >> -            { 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
> >> +            { 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6150 / SM6375 */
> >
> > Not true
> Should I remove it or add it behind the SDM670?

You should not be sending patches which provide false information. Why
did you add it to the wrong line in the first place?

> >
> >>      },
> >>   };
> >>
> >> @@ -286,6 +286,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
> >>              &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >>      {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
> >>              &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >> +    {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_1,
> >> +            &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >>      {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
> >>              &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >>      {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> index 4c9b4b37681b066dbbc34876c38d99deee24fc82..120cb65164c1ba1deb9acb513e5f073bd560c496 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> @@ -23,6 +23,7 @@
> >>   #define MSM_DSI_6G_VER_MINOR_V2_2_0        0x20000000
> >>   #define MSM_DSI_6G_VER_MINOR_V2_2_1        0x20020001
> >>   #define MSM_DSI_6G_VER_MINOR_V2_3_0        0x20030000
> >> +#define MSM_DSI_6G_VER_MINOR_V2_3_1 0x20030001
> >>   #define MSM_DSI_6G_VER_MINOR_V2_4_0        0x20040000
> >>   #define MSM_DSI_6G_VER_MINOR_V2_4_1        0x20040001
> >>   #define MSM_DSI_6G_VER_MINOR_V2_5_0        0x20050000
> >>
> >> --
> >> 2.34.1
> >>
> >
>


-- 
With best wishes
Dmitry

