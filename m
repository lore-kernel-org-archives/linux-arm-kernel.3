Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DF0E9B248
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atWeCfnf8b/NdVkyr56hTky4XjjMPB6Vdu11M3dtNFs=; b=aeK6pcvRgRJyOpFWD2nycAxo7x
	XxdH9+bWZmYUYuPq3UtQMrgQg0XKCz+1ZO/FMFiPJsprQ1QQh1NAaPBryztYra6jj+JB1QvIK98jn
	Vw+nwsK9/WgANfI28RLkwjDV5BsPj4provo7lZUmbfrxFHDUjo2rLryStDa7PUepb3qdXiHe/ZgCf
	tNHiVNU9UIC2A3aNNr+rBi05urtspLuHtNlhwXcrnFhnt1McATSK/+TRQUHfsZgr67l3ETJBka7sP
	UwL9EXcBXa/QWVrNuMAK9gImOwszdADG4Y6pUtxPQ3Bn5yA0mMnOC3iVJ/RXtxEvAiasn0XPNQp+L
	6UImF8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupB7-00000001oGd-1YB1;
	Tue, 24 Feb 2026 09:58:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupB4-00000001oFl-0eIM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:58:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9sNGD1958728
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=atWeCfnf8b/NdVkyr56hTky4
	XjjMPB6Vdu11M3dtNFs=; b=Ss/EfuRLxJD4Jo4rOx+5N177MtA+FEq5jQgZ1rkL
	W9tFvuyPEQRI7ZOjT3HZqiqByKq1zXOIIS8GytrhpNV7SeOvoy446wsSUrGYL3D0
	GbbegVReVhjIQtLHy+BFD5lEwWCE0FGz7mTpjPbtuZUeiPgGpEcwISVajjkinrj1
	hYnYsp+0WTPbx1mCUpdb+5tPgILMtOeZ2xb7Xu1bUbWLU3Ke2z2Tfu0aHDCNb7V2
	yHHD0+ZseoyurIgCbiXo8xIbI7HLj+r7N3Zzn8ZMoq9TxlxlrX4zt+hGA/0w7B+/
	JeAREjw5j+3gw6K+4WEIPdEolGgkeQK00X1rFclBBz9LUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch45691m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:58:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71156fe09so4270536085a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771927080; x=1772531880; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=atWeCfnf8b/NdVkyr56hTky4XjjMPB6Vdu11M3dtNFs=;
        b=GgtAnqGIkFCmByUBBdF0yB+pSgjLZ67Z3JYPKkTRjLS4BuHKW9ZBOVsMFRqKarKf9u
         GrJ3zAOR+lZntEBZWU2pmLx75bm901MjbZzTxluKe6iDB5O6thzsjzMNnmVxsyIe2hCP
         vsdubSSTicenefmLGxbPEsfSuqDkKuqLCc9+M3nqMOsVfVxSwb7J4o0isHFXnm34QLnt
         PXy7voyud58FDusqsrrGsq6vSNCoKcrQPPT/uDnrAmsqjK4C/Q7noyMckYsxeBeBNrXM
         oLQAwvwmzua+FFsgP8OE6mukQTTp+wgJXiYCYUvauDLTfLS97IW+JxvNGso9OEc4+T99
         WCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771927080; x=1772531880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atWeCfnf8b/NdVkyr56hTky4XjjMPB6Vdu11M3dtNFs=;
        b=OghLqVZCqeKutMNhsMaK8YcCDaBtnJmY4dU6ZWVINJIqE25YSC4I77k09sgGVSRTiN
         v/mfPcOD1fyopYrf9SbQYx2NvU37eBTu996yXeloBeHZKnH1MuPqBomTIUVam52ZS+Hi
         tgQgtKNy72hrjaaBGaY3BZQC+zBAC2DKqK1W4r8QPoT05uBBBgwzxF//goJE+drDXDgl
         8b+oeHLQNZhflJUN+WIWTIc2DPl4SHUsrM2lE+4fSQ24Zm7DRJ1AT3Zu+NP95Kc+Z8/R
         lsLH4lx6eo1VuVmyOF6RNneVjHmYH4mGOsZCmBkUIpFIYHJkqKdNas9VP2JCiOXlWum+
         S7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsc/rc6FBuiLoUzwwjVyH3kIJNij1lND0ousuERTDShoZNROoI8xwp1dZD5ozrNs60/Rq7CGl5Qc6QbcVmfQwb@lists.infradead.org
X-Gm-Message-State: AOJu0YzeFpVWMXeuoGGWHlaakk7l7JvZQ2k5p4RX3MUxSpKRtaNuygMr
	/ZbBySxipoWKAQyaDXtW8oZNEiRYloBVZkq8MYiomH8UWNUBJUyKtfa9CamaR32jvId24EYeo7W
	Gor4HIJhz+VFmGeEmeo1fl6x7zee+JzISLes0yRfPeNtzeYVeflC7QDJ1X5ol4Gdu5gF8M6Fs2D
	1PZw==
X-Gm-Gg: AZuq6aLGFWVuTPR+1HRDEadaOXZryrkbSIivpkrwl138PaIk2VDn6o9b3os3qoiI7wW
	n2nPC0JubUeogT8bMIUKp2jVaG8zowqDCKeV52k6F0H5kcuSVnPRLN5uQ9xohy4dbBot6PnxsnJ
	9MgjulX0qDn/6qxsGOuuAeCfgoZJUoqOzo6/KGgsy/+wOdi1a1OPjrReu8SAzeGWf/dxGnCVdD3
	Qkw+zyZGxu0qARBG0VDhZfdeg9YbsK8GyUOkGrx7uvz5cToocnfmi2auuZhGIPPCaC26JvPl3iH
	VTFttZQNl1/fU8lCkwPMIkpxYNWj9huT8/LAbOp0qLKzxNh7cTXOgeuO7p52PLf7lQiC6LOIpoh
	bhcaMpdo1cRY3acVVBDQOmV/NaM6vu5jMHa1/
X-Received: by 2002:a05:620a:4587:b0:8c6:d64b:be43 with SMTP id af79cd13be357-8cb8c9d1dc0mr1513681985a.6.1771927079601;
        Tue, 24 Feb 2026 01:57:59 -0800 (PST)
X-Received: by 2002:a05:620a:4587:b0:8c6:d64b:be43 with SMTP id af79cd13be357-8cb8c9d1dc0mr1513679185a.6.1771927078924;
        Tue, 24 Feb 2026 01:57:58 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00768sm24787904f8f.10.2026.02.24.01.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:57:58 -0800 (PST)
Date: Tue, 24 Feb 2026 11:57:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Message-ID: <66i6cgh5zmz32ikwjvrz3gtezjotltqmfzdai7ybwjhanx3bif@i5g62ziautwq>
References: <20260212235842.85934-1-dakr@kernel.org>
 <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
X-Proofpoint-GUID: 1w6VyMWd0kCDXaH2jnlWi_8C-9oL67md
X-Proofpoint-ORIG-GUID: 1w6VyMWd0kCDXaH2jnlWi_8C-9oL67md
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfX0ZKgB+ysGJBk
 yq/1X+shpAfITUBbPn/MQ7aFs0gjwdR92ZUDqAcTsM4AScKfNtvNbibhvkffLzzNACWy4mbwpQa
 aUeXrt5i20NH2XjhIbONwYQURwJoH464SN9bGnqWm37LInb4omjK2GJxxUHI1Yag+mVRuItjb3E
 GbSgED1oVjnE28C/TsPWAKs/YTafjQPo7z8eOhi6Chc4fg6Dn4c8sTzR7Z+QUHwICiJIVpNUO/z
 Y+9lqYdopzRHDoe5zgjgwy2hT9R8mqalS9lNW2rTRDdRx30zaTPmtFh3B5wWNhrh2IG1AeNGbbl
 TfPboAB2X4uPBA0lprpHjQVC81GlGkoxbEQMS4gw5sDStIW8kXf9xoTOkhOLWuOBgOJC7eqdc1Q
 Lz/REgPmfrAdcaV0r2+RZpkTaZfm8meue46e13IR5rh8qczLXQHG4VvYtoInu6jhbDnzvVXaxpC
 DpoWXI0mWNYyldhD59A==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d7628 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=8f9FM25-AAAA:8 a=5g7N3gLuN7TUrZyG1CYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_015802_312045_AC911636 
X-CRM114-Status: GOOD (  26.95  )
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

On 26-02-23 21:21:29, Danilo Krummrich wrote:
> On Fri Feb 13, 2026 at 12:58 AM CET, Danilo Krummrich wrote:
> > imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> > called from IMX driver's probe() callbacks.
> >
> > However, it neither makes sense to register drivers from probe()
> > callbacks of other drivers, nor does the driver core allow registering
> > drivers with a device lock already being held.
> >
> > The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> > device_lock for driver_match_device()") leading to a deadlock condition
> > described in [1].
> >
> > Besides that, nothing seems to unregister the imx_clk_scu_driver once
> > the corresponding driver module is unloaded, which leaves the
> > driver-core with a dangling pointer.
> >
> > Also, if there are multiple matching devices for the imx8qxp_clk_driver,
> > imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
> > any subsequent call after the first one will fail, since the driver-core
> > does not allow to register the same struct platform_driver multiple
> > times.
> >
> > Hence, register the imx_clk_scu_driver from module_init() and unregister
> > it in module_exit().
> >
> > Note that we first register the imx8qxp_clk_driver and then call
> > imx_clk_scu_module_init() to avoid having to call
> > imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
> >
> > Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> > Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as modules")
> > Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa8x
> > Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Abel Vesa <abelvesa@kernel.org>

> 
> Just a quick reminder now that -rc1 is out; I think it would be good if this
> could go to Linus for -rc2.
> 
> (Just in case it helps, please let me know if you want me to take it through the
> driver-core tree for this purpose.)

Sure. Go ahead.

Thanks!

