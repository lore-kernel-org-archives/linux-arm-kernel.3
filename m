Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB658E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR+rDjRYRPZhYRjSFOwWeCZzooZ4kP9UqFam3k443z8=; b=l64q5pXNoVpTXDbYXJUtz4IKVb
	7dnGHqocjjjnYIbwiJok1hPotgnPpFhGIZV9tE7PrAQZcINGUazHVlWy7cQd1r3T8bG6BQLPC0r/M
	osqSmub9zc5SmADmj3gH9q7STJS1zC8hv/tjKpGsFArDL+LpA3sOD+bHpOLbyRm1g7597rkOe+6ox
	NKRw5Mdi2IopUrX8mnmSyyw3wdVKtuuFfsUsM+Rj0nrrafwoZhpaGuo9DL6uXlSJ+A5GRbfshrG1E
	2GsaYV1l9J8SVI3I/RPKm7xcvtS6zImt7O4wtWGIyTe9FETtKITwYn8Ec0aQr2geLteDyUaCGmKa0
	Gpq6nHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFBd-00000005DN7-3Tk9;
	Mon, 30 Dec 2024 12:47:57 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSF9g-00000005CjC-3XWi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 12:45:58 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30227c56b11so106918791fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 04:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562755; x=1736167555; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wR+rDjRYRPZhYRjSFOwWeCZzooZ4kP9UqFam3k443z8=;
        b=gFJ0Rr6F+KzhxK4sIP1VsOW/CbaeQJU/xOtiOprNdoprr+eEsfpuMX3n/Q/ypTBM0+
         Kq81v9hWhjmeQB8vQPO6kupcKVs03v+v17hIUjU908BAaoZCoviBpRlT747jNvfXilYY
         VFvVxso/gdwLX4MtX/w97bgZLN41QfoFmsGYBnvzFjIxOpblxMsLPQD/xFwnJcIcS2HB
         aGvFkpQUBaIs/MUrIhEmCaX5iTETu/ZmoaJlEUQ5B+ywFek9vsgIdQLxGJUSFs2+gNar
         DWsUu2b6Mu9v7pMcXN/V4rDsDAD7p0sg3N/ZTIyS4WK+dxnMpgvC1M6Av+Qb204HVv+F
         T89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562755; x=1736167555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wR+rDjRYRPZhYRjSFOwWeCZzooZ4kP9UqFam3k443z8=;
        b=kTerq0p15XfWKE/AsSAiTi9FpvUiqSwD5JvwUXEHXmIQQEI2I1jGlze7F1EnYTAppy
         eDQ3Pt3M7G1eo7TOw4+xnU7d4SBxUhc5kljEyNKJMKP5fsS9ZeGL44OOVaBANnmOrwEt
         j2rxwQkPrCI3RGS6KtUMsjJz7d7ByucUTPL3GLALvi11LK5DB3POLRnyxYG9L21x995F
         gksaLpDF0TpRdVBqn2cjvcN98D5isQz/4Svd6GHK7fs+sqZRDco8JTj9e+dfbGe85kVg
         ul3iau1u83txC4qfQeH/NRXBQgObSrAo4fDTVNyUNetiXZyX2JD89mKVra3acU2ukf5/
         LZWg==
X-Forwarded-Encrypted: i=1; AJvYcCXqyEP1rzn8uKbgt0CTVh93wy1HJBZcWFwI9B9hj42Rw3yJ2LrRoQoiTVfZqpsCM6OWOmDomOwDIo346TT3r7US@lists.infradead.org
X-Gm-Message-State: AOJu0YyyuhWMazlFEgLoWx3LV+HFh2YmKNyxbNMct+LvEZIWbra1YGrW
	X3k58hlB/f74vhllUXsDSkSTEZhx8GNbHhqZ9a7xYERab1ySbcsXtP6UuPVMHXI=
X-Gm-Gg: ASbGncu/nVAcLl1RQ97xPaC4A8n5IrYo/ZmNbpwMmq8PWmR5wTfmligQZIVJTjWtaHa
	1kRaibuZIlfO3LvYthICBgqDNi8bM2eHu9xVX+0bBTOdCwrUrwqLOrwkQldys1gvg6V57Gt4Mfp
	UGjFfqZ+dFHzQLtdUrTGuXqjfHcMyZYTEEWb8qEOpuXTVOLwMHu7/19ue/giiEmder0+9CKvnZt
	CZtZxDNzb+9BrrG1wjhynJWL1PuEf9n0r+r6hfYZJEJLos8hsPMMW/QKqtY6ljbMjKrvGmTv6pB
	Enc7G1WX8zIbDm5D1Lt60tXVgvuwjz+HIFzU
X-Google-Smtp-Source: AGHT+IGQKU2FvLR9cA2rX0pjCPif1JwZJgsXfRJ7/tnNeUSB87XImquoxTJIlGTComk+jVqCQS1kGw==
X-Received: by 2002:a05:651c:50d:b0:300:3de4:ff57 with SMTP id 38308e7fff4ca-304685f2d61mr135629341fa.26.1735562754937;
        Mon, 30 Dec 2024 04:45:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54244e19cdbsm1240805e87.132.2024.12.30.04.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:45:53 -0800 (PST)
Date: Mon, 30 Dec 2024 14:45:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 08/17] drm/bridge: analogix_dp: Add support for RK3588
Message-ID: <n7xgy6v7txz56ew3mcinwhnln4jxar5uxtogs3om36ft2y4wz4@ln2uqsfaszbi>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-9-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_044556_878690_776824ED 
X-CRM114-Status: GOOD (  11.20  )
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

On Thu, Dec 26, 2024 at 02:33:04PM +0800, Damon Ding wrote:
> Add max_link_rate and max_lane_count configs for RK3588.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

