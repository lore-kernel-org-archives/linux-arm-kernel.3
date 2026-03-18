Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D56103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=; b=nwUVLdCVVg50gpP3e0oHh0NiR1
	9m4S+gK85fRImXL4lHEawSfV4Q1xJow4YCjbR4pyJrSeqPMBDOepYmSKyDkJRlgLHlwX30tsxx92O
	8KNDPfqSYrD5td0hK38EKGMHSpE9JUKUahsDBdYB340I3w9QtitXgIRFE1gfiIh1VW44AscKGDwiI
	2ZeNU3gCHEB7VjJOm3BAVC3Yq9hZE2qGZbYSK3CV2EZ8QHVCrCPsqIsUnsFOEBrl5Dh7JwAn4lWsP
	GU3UZpvrRTala0PZ6+0UM1PCzC1EYhf738Xiz/EaOlhdCf2RPp4jD0TMElzDLpQRmiyeJqz5roSu1
	/NrHEUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t08-00000008jgq-3FfO;
	Wed, 18 Mar 2026 15:40:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t02-00000008jeZ-3od3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:39:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXhvG3963591
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=; b=g7Qc9Gzqv7FTuSVV
	sx5RAE1TLnpBzhaV8WNbGJTH+G426L1AjdZhaiBTjFyHjYTVj3iof5a8Rbn+UsPr
	1cLq69tAJB8S5os7xGHoAR26JGe6g7Fzg3fcoW2cF/ACthdf7BGy6O7QIoNp9dOh
	rwuzw58pQX2PI4Fs0j2za/no/mXbJPf04h9BPRgpIf560jhzeV8ontGzssoqEKP6
	ou6PRFqyJaqmyqNXVMP85bOrSxEvABpgSGlEBOstj4elQBd5yE3GO+M0aU4Em0df
	aOZUwoxIIs/bYcz4PvxyOxI5EzhhzsVBh8NnD5rRAcmslFWWcxpDoZ2eOhVO1Wdn
	wQ8vAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3vwd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:39:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509007aea22so325110451cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848397; x=1774453197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=;
        b=CGvmh+bLPBh+HGk5RWeDocP43NQjxkLp+6gTxT+jFXyVp8RBneDeSVmFUIDKw/nOSB
         a4kxojT19Lp+4z7EGn1EnjUSMYOrHJ7Tw+bF8Qm8hxt1u7JSWm+vfR5UWeevLOsyu5k1
         OKpZVdKTs2njNW4lOC99I5vOcimqMtsSb+XhSEPdc4As4kGpDCVauWrg1nyWAqQX1Cnk
         WU0xhQfuDX1jC0Z78XwwgMgFqLDwwq6cZ9Wjlu6Lrds48kpF9IUDv1KKJraDqZ/+jeQ3
         g3cDr3XwL34XCytbrL8iyVy5nwo2VtD0EPPNSdztW8Nxyuuf6mVOqB6uOjkIHjxOMD3d
         W/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848397; x=1774453197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=;
        b=PK9Rj93goMjyTyuc/WTZwKHFkALQGCwAaMSrSoW5P+77sWSqPJ63UDeqRi2jzUo2cX
         JEaDc2iY9REQQ/sSViEnAjZ3a0XwmeQFt/g6nCmGzwmWNLm9pbd3072oDn3BMCgBX5ev
         Q26fJvBJukfJtqjjslDuerMyfhGWAapDWDuYLoBxzXa9okdgHuxCJsP0CEbRXBt4IYVj
         ilEAqpjn3F1iVPAyNQUaAbZfP10F8tj3lsCuhuoSRez3OhyD5dTUA7TSLt0fc1uSFZWb
         dmSXZUZwTGau0HzJz4WpaGxutQFxfIC1BZUtAsS4w8qGF4LXK0nsXbaHGQf6cns0qoPH
         BYYw==
X-Forwarded-Encrypted: i=1; AJvYcCX33y3i9Ow9kQL6Z1o3Ofmp39Qp61L0eMGApTucURsiZjKuO7VfsDbsQHecF9cipsnO/vcRXxm8ouEl2XE6nLtL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd5jZhiOsFmZBVJFn/01aWlypSOY4w5mBiF+K+XSHMwFqCW7yx
	EMDxllk93Hi6y95VUucrbVIrBmXCEdQp1IwBIct+RaVTjP+VCfUVl8Phk1RcqO8aPuhSLdB53FT
	FV96gvJD5kctUcZ4EQftH3z9dYrm33VMALhF5YS5yCp0xbvfzMRtNzgzk8kO196sOSQ80mnkv7P
	NYWw==
X-Gm-Gg: ATEYQzy1jmJMNfOiuMel6ZzRW+FjdEB753xw9xYPPenE8dwagnZ+0NfaRbSL/3QPBNF
	un2weynOLYLFtSrR8olZqC1SGpm1SQQp8xOnynTfRoHa+1V74C5XQRr+t0veui8w4bNAi9allw6
	TjKOeTC9i2iJcBoxU20Z9LhA/Is8tVwbzJHWuGk6e7PQoYdMWm9zuBRG1TIOmsX4QbUdGe6ECHP
	ldv1UaC0g6VAS+Ua+GTL0VphJUHDijeAzpvCLObUYr6JLA+TQbjCNgcRJNxA0TYf4XfbZtmU0qe
	nvQ51VwbA12Dt9cJSatt1yaDXKTod3pff06ET2HdnoRrCw/reVwZze+773CG9LblNW2IaIWyDb5
	sQtIoPaXfin04jOpE7V2oiucibtk=
X-Received: by 2002:ac8:7dc2:0:b0:509:473e:2a12 with SMTP id d75a77b69052e-50b148a2691mr46167631cf.48.1773848396974;
        Wed, 18 Mar 2026 08:39:56 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:509:473e:2a12 with SMTP id d75a77b69052e-50b148a2691mr46167001cf.48.1773848396367;
        Wed, 18 Mar 2026 08:39:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Date: Wed, 18 Mar 2026 17:39:32 +0200
Message-ID: <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260212235842.85934-1-dakr@kernel.org>
References: <20260212235842.85934-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69bac74e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bTwR5g6i7njH7xachKcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: W-Gu63isuKKkOl_vTpXFOJS3oTV_c18F
X-Proofpoint-ORIG-GUID: W-Gu63isuKKkOl_vTpXFOJS3oTV_c18F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX4ocjlWs7iegN
 CfuQnMj39Z5l9yslsqzt3UBGgHbo3uxeHfGIuQz3AhQKdgbK1YXAeUu5dIL5JPDRdvFaeBOkXar
 sSnQ/Q0Qc93vC+ME9AI7lxQRWhKGCPGXipHqAqedULp/t+x2XgwpIzNxi16etpbd38Xynf/dJ6F
 g0Gl1dmxeNe1fE9F/AvJDE3SQpNmtNf/7XrjR6+3nH8CCQianabmjXcGiVM071QOvo2rsTivk0K
 0RjvB7djtnChAJjIeG6kTRZ5Cqct2cIWCmK53etzPxiCZsR9vkGqUzCAtT3uFu5r1bpIYIb4/Bm
 sqgCZRBPO3sK3h65jIWBX4YbtzJpWun1WjTThEluE2TsJ6cWLPfG+LuYqmlCcdmEm4i49R5Man8
 av/cHrWXCSeZ8mCuy7799CMD78SVZpyuIo0Xhko4J0EWGD+FX9NAjvBX94bD9byYS20KvloQ2xW
 LjDQxmiyjXuaMkf4Zcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_083958_973594_09F6CD3E 
X-CRM114-Status: GOOD (  12.19  )
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


On Fri, 13 Feb 2026 00:58:11 +0100, Danilo Krummrich wrote:
> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> called from IMX driver's probe() callbacks.
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> [...]

Applied, thanks!

[1/1] clk: scu/imx8qxp: do not register driver in probe()
      commit: 93a6d39e78bfa78b2160621aafbb490e063f12d9

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

