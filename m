Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA6DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 04:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=; b=vIFzUaxUsrXzm+tPJ7NTUeNkE9
	qcUjOPU4Ng4ulA6kCBF3vZR0bpQEESk+IXwV2NPE+r528tYooroEvhVrPTY51slFKLVPe1WRKEHEv
	H3/9EPpXapS8rSX7zsqa/w1ZUaFxIIkcWpYkXYR6Mx70WhOojNq1P7qoWLL5yhemZ0Z7HP//Htc8g
	3zs7gRbAfwWu7Es9/S7zZaPiN7OY/HDAuEPrsGeR/PyFfjs79ZDDqG2V6LNIJ/xdJGqIEeZb3K8WC
	/qefP00QP5CvXIfajmIQCp7yA0uEK20/qktOGufoMDg3/RqoBGN0Yye1EBkDAJmpwM2fpJLMB4Cja
	frrSSRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBqk-000000004tp-1DtU;
	Tue, 19 May 2026 04:14:34 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBqh-000000004sw-42uI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 04:14:33 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-651b4d09141so2968569d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 21:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779164071; cv=none;
        d=google.com; s=arc-20240605;
        b=EPOYN3/0d3tDV9lu1fy4A8kV2eVxv8t3BokYA01ojxPRftdHQXytc4TL0NdGIgSsFB
         NuIF52abQQQ3wSU6axWo01p2seBqV7J5xyTQ/sdX+aUD1S7pVYuwmHUC0MLTAffMBGWC
         GdX8shH1uBjii3y5caq65wvIIJUO4O/GhJ1MSEDyCbWjmU8aQntQA4zv1NFd45rw9jTk
         PRrtOaHGNFXqdxJUwt/De5OdSSzqQ1dxcWygo7RPxRTgTHxaA7/0xNsUOVoVEJZj+7bx
         ej8hQqtW+hPBetgKxxA69hA+Z6AERexUH3roYkEVW3SibslfaOLQyTV9tPKsRrz0fZxO
         HTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        fh=vdWnSf0j8SEGGZ4MCaxDmAGCS3vY6kObc9C66sl53Nk=;
        b=RmqRhuJOFElm63JbAezAPm6ofWtjec8FqiUP5oluLngxJgYXGCXDMl8qcZDncMQehI
         M46s8WMcEXtYoEclVDyFchALnxfaknyayMU2NZ+QxN5Uknd1wgfV8jgpWEOJ6yKrq5Hv
         aBy7d7A/ilBT/u2t6edGS6EDKWHEIRxDhvwvMcPI+d5tDV/tLbW760N7a7WptALs+i7E
         KAvxTjgZ4DJUvSMpP0W+uUj3wbFiDP9lyliP9cGBn0zbaITQFCKULyGwwMxjxgiYpRMW
         t2tPCb6ioOH0HnM1OAAHjB7m74t4v2RsMQITY+MmfW3I1w9uXSCIShAxhncbmBl6zMU1
         XbJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779164071; x=1779768871; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        b=bklqKjZJTJGeIKG4coSorCVA8TEZAfd9QaU+idJ2MGtNfFN+8+AvUmO05snSO/PR/i
         ht0UmdB+52k3zp3/wSnfyETv2F3AhvkT+0pucLoViJidmPgnl1H+FM3xluaJJhQ7VQq7
         DJYP7EbbztgOt/hC3gRh29/Dv3gNyHJF0wQmgtgFEf9PRNoA5Je9zVXiQ3LTgzBiFKbZ
         4tSA2UrD59VyiEC/u04c6xsOdu/9vu76eYYIiYBcd3uhsSg7/J8/Az92/rUMj1lDtIG1
         /wkAlgeL22I3L0T7s0Fa9O7Pj8RMBb+JzrMawQoHPi9Zl6OjFaKUxZMWTeZxEFFrpa0R
         pG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779164071; x=1779768871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        b=E5bE7Tm0+JsptpW56+oU4ijLY4hlylhWsqb5+gqSTprT0tgIzLePDCePN9ZXxFGGPg
         6UOEXSfAVTa+YkTHYk5DZiLXt7aqJoBr0kh02HnxMZ4UXgThRe7SuVuPCmcZa3HduK8V
         ymvhq0XzLq2gMiZkhb7ZX1v3mBHxeCUKl4gkmYZNr4Xdk06D3OzQ1kRaCvUGGSFsoSWm
         Z2G/UZDRDOuhry7VO21M3VWGVM5c7KKLNleusa3FX6oYYHJUDxGVDUsRuej78fTlr5f8
         OrredFJyNTFOcmbAzW/nX6d6oeWa6JWZGj4Amap87pdbTNilTIue+Uxa8e3h5sjo8W5m
         Cm3g==
X-Forwarded-Encrypted: i=1; AFNElJ/SAANpHRCioe1XHtJSxOoRXSTZ8IsBsbLybJlT5uctIShQoTG9/08wi4cuT9oJi3Pxi85yGH7wWNb19CwU6lz1@lists.infradead.org
X-Gm-Message-State: AOJu0YweiYqarSArO1/iMKV/urDbLgGxi6X0Ya19rFUWOUTHWcLvX78c
	yt5Fw/MlSduAnUY3dp4klrXLZyYfrllqUtg68DBmYlCpSOGvNqfxb/pvPxcKzxGypYTNT/a569F
	tSEqGVrjsaQ8AKOGyDe4uEEKPH7EPZxA=
X-Gm-Gg: Acq92OFZ8yLTvEOZl/nQnRG+iPNcxafNOyfjcYwcGbxsb+Yz/BIYWFA4dw6vYPurkGz
	eCDoMAt7X6res54Y8Cp24KmVWEz3N7119ddkDIIXFsK2mJrvVM5bIgsBnsjmL4dbQCWaAIFGY+s
	zBgYmfBaFdU2Y1GE7PO+Z/O7pZp3j4YH8JK5R+9Wnh5nmZHqgqyM3zXe6AquIrsQoghMhrFib7C
	Kp07jUweGmmMFLKOxlOUNU2tWC7hZuXYDYH+ay/2jPpe6U93hVSHusPpxp4HfsyJGq9FYzCOvCz
	oJDpoRMD
X-Received: by 2002:a05:690e:438d:b0:65e:782e:9df3 with SMTP id
 956f58d0204a3-65e782ea2bcmr1341256d50.7.1779164070708; Mon, 18 May 2026
 21:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260518125500.1000083-1-lgs201920130244@gmail.com> <202605190845.KlMSPp80-lkp@intel.com>
In-Reply-To: <202605190845.KlMSPp80-lkp@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 19 May 2026 12:14:18 +0800
X-Gm-Features: AVHnY4Km_xmIfqiLJD15ZaDQr9lLAh1Ogha024FXgf4YUM6n3JdHCvcB7t1E46k
Message-ID: <CANUHTR-J7VY4Jx7WVqEpC+Xg2cR_Rnb=gaA_xecyNO9dmFcyew@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: mdp: avoid double free on video register failure
To: kernel test robot <lkp@intel.com>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_211432_020236_5D20C23F 
X-CRM114-Status: GOOD (  20.50  )
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

Thanks for the report.

On Tue, 19 May 2026 at 10:13, kernel test robot <lkp@intel.com> wrote:
>
> Hi Guangshuo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linuxtv-media-pending/master]
> [also build test ERROR on media-tree/master linus/master v7.1-rc4 next-20260518]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mediatek-mdp-avoid-double-free-on-video-register-failure/20260518-211648
> base:   https://git.linuxtv.org/media-ci/media-pending.git master
> patch link:    https://lore.kernel.org/r/20260518125500.1000083-1-lgs201920130244%40gmail.com
> patch subject: [PATCH] media: mediatek: mdp: avoid double free on video register failure
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190845.KlMSPp80-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190845.KlMSPp80-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605190845.KlMSPp80-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:1217:33: error: expected ';' after expression
>     1217 |         video_device_release(mdp->vdev)
>          |                                        ^
>          |                                        ;
>    1 error generated.
>
>
> vim +1217 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
>
>   1172
>   1173  int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
>   1174  {
>   1175          struct device *dev = &mdp->pdev->dev;
>   1176          int ret;
>   1177
>   1178          mdp->variant = &mtk_mdp_default_variant;
>   1179          mdp->vdev = video_device_alloc();
>   1180          if (!mdp->vdev) {
>   1181                  dev_err(dev, "failed to allocate video device\n");
>   1182                  ret = -ENOMEM;
>   1183                  goto err_video_alloc;
>   1184          }
>   1185          mdp->vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>   1186          mdp->vdev->fops = &mtk_mdp_m2m_fops;
>   1187          mdp->vdev->ioctl_ops = &mtk_mdp_m2m_ioctl_ops;
>   1188          mdp->vdev->release = video_device_release_empty;
>   1189          mdp->vdev->lock = &mdp->lock;
>   1190          mdp->vdev->vfl_dir = VFL_DIR_M2M;
>   1191          mdp->vdev->v4l2_dev = &mdp->v4l2_dev;
>   1192          snprintf(mdp->vdev->name, sizeof(mdp->vdev->name), "%s:m2m",
>   1193                   MTK_MDP_MODULE_NAME);
>   1194          video_set_drvdata(mdp->vdev, mdp);
>   1195
>   1196          mdp->m2m_dev = v4l2_m2m_init(&mtk_mdp_m2m_ops);
>   1197          if (IS_ERR(mdp->m2m_dev)) {
>   1198                  dev_err(dev, "failed to initialize v4l2-m2m device\n");
>   1199                  ret = PTR_ERR(mdp->m2m_dev);
>   1200                  goto err_m2m_init;
>   1201          }
>   1202
>   1203          ret = video_register_device(mdp->vdev, VFL_TYPE_VIDEO, 2);
>   1204          if (ret) {
>   1205                  dev_err(dev, "failed to register video device\n");
>   1206                  goto err_vdev_register;
>   1207          }
>   1208          mdp->vdev->release = video_device_release;
>   1209
>   1210          v4l2_info(&mdp->v4l2_dev, "driver registered as /dev/video%d",
>   1211                    mdp->vdev->num);
>   1212          return 0;
>   1213
>   1214  err_vdev_register:
>   1215          v4l2_m2m_release(mdp->m2m_dev);
>   1216  err_m2m_init:
> > 1217          video_device_release(mdp->vdev)
>   1218          mdp->vdev = NULL;
>   1219  err_video_alloc:
>   1220
>   1221          return ret;
>   1222  }
>   1223
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This build failure was caused by my oversight. I missed the semicolon after
video_device_release(mdp->vdev).

I will send a v2 to fix this issue.

Sorry for the noise.

