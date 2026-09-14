Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175CDC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9bQ4YU3lf2Q7aRmm0fsqRKc4V3MxEw0Tq9J1jmu9YoE=; b=a8b21I5o0/w6QZ
	fxTEtSvqS3g5HnhZu5ywVPJZB0m+9BuaKrd1stb3zpd81UCyCSn8EMNeXc/yeiTjY5my1nDXgH9Po
	b7/b58sb3W//Uf+xfrKcG+nqsl7nJyZC6kq4XWo0umCw4jPoZKhH6hYChIQmAbB6nD47pa2woO2PF
	abKpjPcEP9pEB1HfROql4QQDyomSjcX6yO0LODcQtuCUBxwVIs+umC+7tC0Lp7a65bUJVv7pSeWpS
	9HaAuWK6Ek4vXFpYBRLJzpZRZI87uRIdHdbQHrcX7ipiBGwXDR5SlxDH48G0WsPGrsVXxsp1OtpXg
	pYJE0q+jkYlEbeQBtTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63AC-00000002z9s-0wUE;
	Mon, 14 Sep 2026 09:39:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63AB-00000002z9O-1kDQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 09:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9bQ4YU3lf2Q7aRmm0fsqRKc4V3MxEw0Tq9J1jmu9YoE=; b=IQpZAO7uXOgsxsH2V0lW5tMHgD
	meTB4Bq7D1cJ179RxZYCi6B6xG2m5TrctBWpIzTXwQWee5VRcL1vZq/D0JKhDEfKRmYGgZ9nyGQa5
	JzMc1D/h9SiMwPLUl4z+06oOnE/3iryCHPn/w8E+8SUCr6IDQvGY1w11DDnWgBu0CUxlNmv12kBw/
	eG5XsxJjQvrYS0MDmB2J8vmNAYpxWfIXpAmweP+sL6/yaWqM/D89UpB2oupNH953owVI6d2fw6UZG
	U9FjOkZkDckFLYJuYiOzvldF2oIOBLzSp1QbPtDBgcs1pdX3S3mS+M8sskyQGhdOzdOpGjwrk1Hzs
	FQLIc1gw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x63A7-00000005S4N-0HIg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:39:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ivqY3739607
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9bQ4YU3lf2Q7aRmm0fsqRK
	c4V3MxEw0Tq9J1jmu9YoE=; b=jMrTDdO23rQOiTJgoZtDVUUPoN0p5YSN4Yn/Mk
	Fhmk5o8Y5nmusXfzvGG6kxzeirnrifpYMBQGCmSp//zeT+pm++wZ7/ShjqOyw4aS
	c06T1PElP+7B8d95J6YEqIncgtpquc6+ltno9sw26Vax9hVsIo/JZxdRr7eFFviX
	kDD8Maf0V5iGODHqDG6uWf1c1lyNxxQhqYQ0/ni/Q8RUy9Fxsprlm9noAkXXbCgO
	bLFXB5Ft1shLJoYhKNpEkqPwSMgmSt+cZZnoJBQTnPL/EnXpKL5YzflrKYn+LNcQ
	XY9yR+5j4fRdIJ8NKgFVJL0nX6xclAA/eprVTGIAvzrbGjdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddys5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:39:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so3755005a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378778; x=1789983578; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9bQ4YU3lf2Q7aRmm0fsqRKc4V3MxEw0Tq9J1jmu9YoE=;
        b=hPK19VpQNE8Tdih0WVn5VK03OhSMJ9Y7GJaOPxRXSO3BDeCEvCadodSgSV4XCYCkes
         fnSjt+dHefjePL7+Td3KffdVqxwZ76LwASeoXClS8U623IYzwRD1sCtv/Qan48i3T9MU
         Ztlnh+/Why+ZvowEFpdgKqd2nzqavzYlbpotHLxXR/LAYIQeL6PS2jkilT1HZUaX8Orf
         IZvcpLY+Z/QppLr4B5itSk7mUG8SGXGXk+9cHioJqFTlZVTr8hm31MmXsO5I2yw9p1E+
         FUaDE9LDpN5Mo8dpT4jEliOagFuoqx+alx2IPCkL1PNcwr/38jGmstEScY7uu4OZ00f6
         MCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378778; x=1789983578;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9bQ4YU3lf2Q7aRmm0fsqRKc4V3MxEw0Tq9J1jmu9YoE=;
        b=W6k+jsox45vDk9X6uTLA0rheOLbs+b3cjv4Wn/Q9RAg/Q96KZ+WPMz7AkbxLLu8fYQ
         NNlbXdUT5DVBXMH1jZSj0+QmqfgFZm8HDqHDuU1BpKxl2dkENN3t4txJEJjn/MWEWnUd
         PpJGmheQY0wR07R/LrhurGN63HHca9XR9A+n8+uQqOGGEo7pazRx9CVyjdmz2hGZEjpF
         Jdndu+KTEN7nUbdUSvnGE001Ha/kLjZaMD71WMI1mYgBp09gS0L18k1Oy1t/RO4MqG5F
         4pk3C6UZCjQCNtLfg9QXW+j9JzhIYcLT/MFO/oKpn1xnjZAKoTqxvUV+z3OZ04wPu6wH
         GDuA==
X-Forwarded-Encrypted: i=1; AKwUvBxK1U+9mT5o/7hu0to/r+ioA2FHZb3NAZ6wFFAHhxNbju5+cBTYi9ffxzT7VzKGvzkEuqa1M9cguL17LcKUWijy@lists.infradead.org
X-Gm-Message-State: AFuF++ketdjfm7BHm7k6Ar0AzPThd1Ge96q0F5GZAMNZSxSL4tAqK3mx
	Zv7EFCXDcwmrkgpHFeuxejmRNgMHD0nVfYbbE+9/tBxMZitYXCZEt7NFusCTmst/7Yc8To5Be8P
	DfEuofQ0Qi1euT2q9BGsDQmvNgdV95BAQvqY62wbs05wVzP29kRZcOwncmvSXsCfS2TLFPhAd7O
	WQ9A==
X-Gm-Gg: AYBFou0UzqZZfcPTAVFDrYQtvuzknfvSWDNe27nzdXY3cH6TXRSHsEsGZ/xTy6rbimT
	a7mhLN27nKxZfPBS8UrCj2jMZG6QuHQTTyvNqzDkDxU9jwYnmIEl+ostPLegbkDelEvDPZpoVdk
	K99fPaeZSo3IrGTkElSNWE9hxROVDIyTCGW0wZ9ahdf4a1JOKFH1oh4mCRveXr+4m8lbfSGhtmI
	qedfuV1K5Ij/SA3rKfILwNPLIXLiy728zEzdWpCvMgsKbWEDWfz6Hma4mJiwqzO1looHSZyhAwR
	V9rerQiMN3x9Lqv2+TP+GO/1DQlkQJWlr8Qv7JUVhO9SLNQ8wXPbXUX0hUHllEZO4nFX3SaghcP
	pV7SOWodSnN1y+Qtp6hwXRa/b+xldkTgUiDMld8EXWn1FpblgtWyxNDCA
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr4246087a91.16.1789378777505;
        Mon, 14 Sep 2026 02:39:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr4246008a91.16.1789378777033;
        Mon, 14 Sep 2026 02:39:37 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:36 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH RFC v2 00/10] arm-mpam: Add basic device tree support for
 resctrl
Date: Mon, 14 Sep 2026 17:37:48 +0800
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHnAp2oC/32OzQ6CMBCEX4Xs2SUU/MOTiYkP4NVwKO0qVaC1W
 4jG8O5WvHuZZCaTb+YNTN4Qwy55g6fRsLF9NPkiAdXI/kpodPSQZ/k62xQCOyc79MQq+BZ1wHv
 vkAfnrA+oxEorVcilLLcQCc7TxTxn+hlOxwNUv5CH+kYqfLnfWmM4WP+aP4xiLs9zW/F/bhSYI
 cl1UW5qknpV7i1z+hhkq2zXpVGgmqbpAyjuxULkAAAA
X-Change-ID: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378757; l=6993;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=fjPHKJ99+6/YYqBG7WRX+vjmWbKlg+Pq7IG5ShfV2Mo=;
 b=G6cSHOVN1KD+oQ8XYfHE9H3vN6W1t5NoY5K3ygsYz9Rh+3PduIxJpk4b7CYxU+kwL1D3oeLDv
 qmtkvthUP9RDap+QGs+epUxoEAXOSYckHHT/KYIEx6f+txONDI8Y5jR
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX7JhD+djDIoAE
 dCLJfXwcfDg2iRjiHC1DtSxaz2WcIAnHg5z+4Y/x9vcmoIwTpFqsBoPPWXwhZo0tzNtY2IB4Eqa
 xZRQ5sZeEEQfUpMqhI4diZe0I8CePIosbxqJhJPQX7MaJy4IOZpFO62rCPePdIwH5H+kEVssJmr
 1pBRgUV5Wpb+ScgghkeCNfXvFLxd5p6Oj+IhNLXegnV9pBK4DTzcX8Ef9xdBUFUd5M+rvbbvnps
 nt2ydkGxWpA3be6tVJM9ziZWn/6tVqXtUjv6+gimpBRIX0ECwmgoFRL73qMty95Paza5x0WyyL0
 nEKcHefFzc4PHXwm9XY/pzlEJ6jRyktDCa/aHAtp3Z22NmLyHpjJxifkLk4IblAe2VWmFpvbvHW
 C4LtW2go3MmaPB6QvKGRj301ptZE+Pu1p3oM/zB1WkU3wFkO2Ao54Ddnw4xETLIwuqdnHpg17n4
 Sujvbdjy6no04A3usSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX/2lfmFGgOd+7
 wWQILgxp+J1dluWVeH2/Zn9MupCEqP1KN4kjvgg83kcs3tFjM3nqRdaG9zmLeexgQC0yUBQmvCw
 oMFy41uQoj1ZaJnKwHcJflyie171ooI=
X-Proofpoint-GUID: DK9YGTP7TE5zQZG1kHY0ct2vwE1nHvXK
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7c0da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=Ikd4Dj_1AAAA:8 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8
 a=omOdbC7AAAAA:8 a=JfrnYn6hAAAA:8 a=eVJKr8h0iHB_2sIDOaAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: DK9YGTP7TE5zQZG1kHY0ct2vwE1nHvXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_103943_580649_CC12E24C 
X-CRM114-Status: GOOD (  24.72  )
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

Notes for James, Shanker and Rob
--------------------------------
This series builds directly on your not-yet-upstream MPAM snapshot
patches from the mpam/snapshot+extras/v6.18-rc1 branch. The RFC (v1)
went only to linux-kernel and may have been missed; this v2 also goes to
linux-arm-kernel.

Please let us know if you are OK with us picking these up and extending
them (original authorship and Signed-off-by kept, changes annotated with
[Yin Li: ...]), or if you have your own plans to upstream MPAM DT
support, so we can avoid duplicating effort.

Add Arm MPAM resctrl basic device tree support.

Arm Memory System Resource Partitioning and Monitoring (MPAM) with
resctrl requires device tree (DT) support before it can be enabled on
DT-based platforms. This series provides the foundational DT binding and
parsing support for MPAM.

The patches are based on earlier work by James Morse, Shanker
Donthineni and Rob Herring, with fixes and additions on top.

Standalone fixes to existing mainline code (placed first, independent
of the DT work):
- arm_mpam: fix the RIS index range check
- arm_mpam: fix the MSC MMIO window size (off-by-one)

Inherited (authorship preserved, with fixes noted in each patch):
- dt-bindings: MPAM MSC binding [1]
- cacheinfo: expose cache-id generation from a device_node [2]
- arm_mpam: device tree support for MSC probing [3]
- arm_mpam: memory controller MSC support on DT platforms [4]

New on top:
- dt-bindings: schema and example fixes
- arm_mpam: fix foundling MSC creation
- arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
[2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
[4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace

Note: the MPAM DRIVER entry in MAINTAINERS has no "L:" mailing list, so
get_maintainer.pl does not suggest linux-arm-kernel for these files.
This series is Cc'd to linux-arm-kernel explicitly; adding an "L:" entry
to MAINTAINERS may be worth considering.

DT affinity model
-----------------
An MSC's CPU affinity is derived from its parent device (cache or memory
node). When the parent is a generic container, a per-RIS fallback
resolves affinity from a 'cpus' or 'arm,mpam-device' phandle on each RIS
node.

The Kaanapali DTS patch (marked DNM) is a local verification example
only: production firmware does not expose MSC register access to the OS,
so it is disabled by default and cannot be upstreamed as-is. It is
included as a reference for other platform DT authors.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
Changes in v2:
- Fixes to the inherited patches are folded into their respective
  patches with [Yin Li: ...] annotations, as requested by Ben and Andre.
- Move the RIS index range-check and MSC MMIO window size fixes to the
  front as standalone fixes to existing code, with Fixes: tags.
- MSC MMIO window size: reworked as a genuine off-by-one fix using
  resource_size(); the ">" bounds checks include the access width and
  are kept as ">" rather than changed to ">=".
- ris_idx: validate the range right after of_property_read_reg() and
  keep u8 downstream, instead of widening the call chain to u64.
- cache-id sentinel: keep the ~0U notation (not U32_MAX) and leave
  cacheinfo.c unchanged; only replace unsigned long with u32.
- Convert mpam_get_cpumask_from_cache_id() and the cache/component-id
  variables from unsigned long to u32.
- Fold the device_node refcount fix (of_node_get()), reviewed by Andre
  Przywara in v1, into the DT support and memory-controller MSC patches.
- Drop the "clear mask on error" patch: the caller ignores the affinity
  on error, so it was unnecessary.
- The foundling_msc fix and the binding schema/example fixes are kept
  separate for now, to be folded once reviewed.
- Link to v1: https://patch.msgid.link/20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com

To: James Morse <james.morse@arm.com>
To: Rob Herring <robh@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>
To: Jonathan Cameron <jic23@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: devicetree@vger.kernel.org

---
James Morse (2):
      cacheinfo: Expose the code to generate a cache-id from a device_node
      arm_mpam: Add device tree support for MSC probing

Rob Herring (1):
      dt-bindings: arm: Add MPAM MSC binding

Shanker Donthineni (1):
      arm_mpam: Add support for memory controller MSC on DT platforms

Yin Li (6):
      arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
      arm_mpam: Fix MSC MMIO window size off-by-one with resource_size()
      arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices
      dt-bindings: arm: Fix MPAM MSC binding schema and examples
      arm_mpam: Support MSC accessibility derivation from RIS nodes
      [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
 drivers/base/cacheinfo.c                           |  17 +-
 drivers/resctrl/mpam_devices.c                     | 400 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h                    |   2 +-
 include/linux/cacheinfo.h                          |   3 +
 6 files changed, 636 insertions(+), 38 deletions(-)
---
base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98

Best regards,
--  
Yin Li <yin.li@oss.qualcomm.com>


