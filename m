Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524B5CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+6ATdAGKsKt7iZsWFgrAlJ3BrFtCxwuxUkj7PKHwzXw=; b=fiG5cLUL+uRvWO06QLM2hgTb/p
	it8MtB86GBH6z0E4Yog/qkk0MCoy1v2Ia2UenSJDr8VgOBQ6CNVGNCQVCvGnG7hWjuZaurCrXvBTV
	keM9wOgwr0ZtfK3NwVCWpbupNHMOdGKNl7jGYV9Z5hYm6T+IbYp/GYb9JjpyaljCw6+5c323VPPI/
	gKa0pBqjzYsCOrxvxADt7oeNGpm4VnjMe0ONAe2xEyZ898uSW80tGw5WWsADjqSDhaqK+06JwQu7/
	M2OL6YIMLFMYqzVggJoItsytculEay2/WxSypcrkxLRtWmKMIs/iL1kGh44AK1LiPdr3CUIOrRdXu
	equmRF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm47-0000000GePA-1SAN;
	Tue, 12 May 2026 12:18:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm44-0000000GeNo-10NB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 12:18:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB3pFx3385188
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+6ATdAGKsKt7iZsWFgrAlJ3BrFtCxwuxUkj
	7PKHwzXw=; b=D2+WYjYHHZ7bYBZJOGHm2B9d8lCd7m3khBVBCgsRuiZFlzByDbk
	984/qgRbxlxOYuF7+5fntfHuviX2C2OQfl+Z/oB6Lu78rqyHXuEk/d52DomH0t1O
	ks8QCFxz700NzYR8owhLvZy2x87X+Z0Hw7y2xegKAPdjy0kcMGzGWZ5eqf+yxA0l
	qIianuJB61LtWIEkOj09P2G/pAlSvWrV4QFHH2avG8m3BW2dIkjAkzbcT2yZNg9Z
	AG5pBcBs7V4Hvinlt/YdM7PHgr730n7SBHbKEx7sPZwxG9QKLtaS5sfA/PoLsjkF
	f2jIkuko6cqJImkZBREBA8BiSxQNId3dJ+A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4k62a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:18:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da31af14cso125567671cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 05:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588298; x=1779193098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+6ATdAGKsKt7iZsWFgrAlJ3BrFtCxwuxUkj7PKHwzXw=;
        b=SPcCfy7PQGI7rGM8wGrLoAWX+0Rv5H+ZyOjmSt/UqzAKH1fp6cEbEbHIEzFdYn6zKA
         pgxwOlSW7la8uri8/qKcqPkLc/TN100FwQxXcfFTKngeL6E4FPeuSAcM4/XKSw6Fz0yM
         ev+lpf/mUHBfEAknXefAKxGCVpYOih3rE7pizPY4+pQ3t72G+mgjmec2PGydpxpGSPK7
         qgwrqsK5QriiQAq3ctogFyyznH38oEkIRAICJua+vu9HqJidnq3kNsekyADklUuRfijS
         dPEyaDzciy3XaVfYAnyj6z4tmmZ+Y3WRn+meZfI+HyhaMhWOLC75RvFYTRN6WztWD/EH
         FUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588298; x=1779193098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6ATdAGKsKt7iZsWFgrAlJ3BrFtCxwuxUkj7PKHwzXw=;
        b=s44N8oZqlbfFjAg39cpNxLSFraB/Vhk6ePEUcAWWv6S+FR+tjhdjgx8xyh+FsnOzTD
         zDz7RfvRnHGiP0BvdzMkPR8jTAW+6I/yn/23rhGFyg/WFloOgSt3+8QKfjM4QoZY6bAV
         d74TaSi28lJqNmZHoh6sLuX8CFoSqWsxr3lnHbMW+8wiaKcYpC4aCPrm9I3piAzGWr2g
         HsyREsUnJ1I1PfBstfVj+0/6Eji6lvgt735Gmaj++qopA4woOjuYEWZHNsJ8N6PsGIVn
         rC4a7YJmIkeMavYTWAcvr+hdNm3mxWtfzgUHqMRX/Yld1u8Gl+MOu/3QeySqYjcMFebV
         pQeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cOIBpYnFxBvnFpnghl+g3xA4hpK7oOqS2HG6bJ+ScJNhvvulr9V2q/69AYnPeq27PKH69semuAbEG1klvawU5@lists.infradead.org
X-Gm-Message-State: AOJu0YwLnrpcsp9KNx65z0Te4cIeAN1S1dFkgvNgkXAC03aPxKeNfT/F
	oGRy2NisuTFd0SB5SM+smTL4uCqcl+V2uAJiqS07JZ5J7fVkVbOIYX9XGaM2ycPpwCE3H0xAV99
	cXsPy7B+OTjXcost5Gi6zgnjQGBazxoDJXVMWNoy1akYqBQkvHpGmLIb0NHoLglJ7+UIJ6+5C3P
	rRSisqzZFKEw==
X-Gm-Gg: Acq92OHcp+GwEBKkg0yoPkXVTyEsMe2uUiBGZTjrZHQnaDBTZtjSHifMRIUe+aKdYVh
	JZZGvjeuha+S0XYNt9mE35DqffVG6GZnqBKILKW8RERnkUR8ZGnnaHq+wgqvK48/Xtk4Erjg1kx
	Thiqb+Z6CTF9ZnbUQVukrcx0PQsBBlEPuDsJ2u70aX2h55hSppseFyZuLPcL9X3dN4fNV0jTNB7
	miCdnqe/S14se6rrWajG6/cZZMvpQF3N74+t18nSRUULCOcESvyQGPQhE7xnPvJKDlqcjqg9KN3
	fy993xuq2FqTu4/GrFgHvphpa6tnQf0r2MTbFo/v4Qc9agyVnk/fCo2fkJ8brHXLyc9KCr1e4zf
	vllkgpwJnsNWVZwsWlYDkohLSPEl1OlIi4PYuKy0MEL8XFQaLAA==
X-Received: by 2002:a05:622a:4ac7:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-514621c747cmr424347251cf.59.1778588297509;
        Tue, 12 May 2026 05:18:17 -0700 (PDT)
X-Received: by 2002:a05:622a:4ac7:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-514621c747cmr424346331cf.59.1778588296592;
        Tue, 12 May 2026 05:18:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm33563044f8f.30.2026.05.12.05.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:18:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] ARM: pxa: software node oriented GPIO rework for v7.2
Date: Tue, 12 May 2026 14:18:05 +0200
Message-ID: <20260512121805.26023-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a031a8a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=-_aiTBz_rQ-7vHLFHe4A:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNyBTYWx0ZWRfX+asaWDrhhB8F
 Uw69DdLd4Q/jeaAp2CUU2ZURBK9uBSFqmNEgwDr/jZZ0yINsOC7GLT5vpmw2xm+6+G4TJUUzFoe
 HJKq7yuNIXK//rS0FkcNDIUbWHGh+jJ6Mre5kLS8bl8jYZuxXYNl7zeP7HRjZlSwBJf3nXuVHOs
 aDEdR6Y0vaGrGeSSN82IuxO1hp/tiTasyA5iBf5awr/U9usXZ4Aa8xsJ+HAwpBNXbvnvflOrFDN
 vZrEt5e/ytYb6ayxHDBLz4SFILYz0oOExtBwD+lLNkSzVkfHNh+KckqKXGmHJZnVD3QQ3MrakI8
 TOYEac+M/oFYhGuI3CheVCK1GkIlKFwr7FkDruu+atBkiIF8s8i0kByVpXIKruZXUrOzto8u/jc
 hm+s837mncGZ5ShkQaNL5NLQaq8eWgsNMYnszeWqIROxUjn+xBChPi3DDGA/9uHatzgxPcyiz38
 Iz7UWO+a/Ix8BBGDWRA==
X-Proofpoint-ORIG-GUID: aVb2MuuK5Kj05p4RPCcDghhq_Vka7cqB
X-Proofpoint-GUID: aVb2MuuK5Kj05p4RPCcDghhq_Vka7cqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_051820_279509_A4A477D7 
X-CRM114-Status: GOOD (  12.52  )
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

Hi SoC maintainers!

As suggested by Linus[1] I'm sending this as a PR for inclusion in the
SoC tree for v7.2. This is a rework attaching software nodes to their
target GPIO controllers on PXA platforms that will allow us to remove the
unwanted behavior of GPIOLIB where software node lookup can work on
matching of software node names against GPIO controllers' labels.

Please consider pulling,
Bartosz Golaszewski

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/soc-pxa-gpio-for-v7.2

for you to fetch changes up to 2c450dd88161abbadf889711d0bcedd7a0504a84:

  ARM: pxa: pxa27x: attach software node to its target GPIO controller (2026-05-12 14:03:19 +0200)

----------------------------------------------------------------
ARM: pxa: software node oriented GPIO rework for v7.2

- attach software nodes to their target GPIO controllers on PXA
  platforms

----------------------------------------------------------------
Bartosz Golaszewski (4):
      ARM: pxa: statify platform device definitions in spitz board file
      ARM: pxa: spitz: attach software nodes to their target GPIO controllers
      ARM: pxa: pxa25x: attach software node to its target GPIO controller
      ARM: pxa: pxa27x: attach software node to its target GPIO controller

 arch/arm/mach-pxa/pxa25x.c |  3 +++
 arch/arm/mach-pxa/pxa27x.c |  3 +++
 arch/arm/mach-pxa/spitz.c  | 11 ++++++++---
 3 files changed, 14 insertions(+), 3 deletions(-)

