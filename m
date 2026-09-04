Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0AFC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fYOgoHy9wmPlB6HPGaAQVHVyL9xOfEZSABUzx83Oli4=; b=tGybSummG9ZnvzY/dgWqq+eqcB
	yVXrte7Pdo1mB/X3pZNImjOE2bYu04fHzYnyuNPrdyqpgWqEPoI3pjyiBpqN9TgbSzdDVdwrWYKwV
	3yLXhcsK/U89NDsIu/CWwkfYpC09xZv36xl95caNiQtCd/putE2KFpI2aKO62TwH5zsAhYhPcSazS
	g8bmpaoZ0OyfIDhboEK9it+r1NbxggAba4d6v7e24LjVeM/ysZScd0F5Km585Faf2w1ALFHUL+UiP
	AwQ4vYqf+FL1IaTc+CDqmJ4hRQmimPNXl8EbzJ0ya3cNVvzrmMr7BzIAYadEtx/5B+A13VSFATll8
	5QScO0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P27-00000001LPi-1uPs;
	Fri, 04 Sep 2026 08:12:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P24-00000001LPJ-3whD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:12:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847meou3234519
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 08:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fYOgoHy9wmPlB6HPGaAQVHVyL9xOfEZSABU
	zx83Oli4=; b=i3ySIlDmBdIx4usUIXvLrhWx/UIFqrKhGJXQ6pmL0KwGFP6HjUz
	z5+1xGXwvsgk0kGhZOjgjFR4BqLUeruKkZ0G2Vr6dfAQt3cla8IrPamp6a6I8ms4
	OB049DsQ6VZxyphRrGThr8NjFf1oQuZq/0EaZVQ9ZMWIRnSUoLae2wcEM+ZZ6EbA
	Hs2nW4VqeuZdOVjj6PwxjMsc7JCP5Wl1V/i65dxOO/6BAf+zYwiVAczE7f/IbXcv
	/GcHzUBBY3FG0gV3RUu+TPb20lr33mkCpWj3L9TX9xnlmslrj9yEQP7sANbluvK/
	+qCnS40Mbwrt+feNvenI5pgqWcBAkdDsywA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp0r0u21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 08:12:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso99897585a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509539; x=1789114339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYOgoHy9wmPlB6HPGaAQVHVyL9xOfEZSABUzx83Oli4=;
        b=Dyt+nSmWlyPX39jrJa8JgILOwdj53WdOuFYFLJlhYfo2pNtwnVkR5C3YbL+t07OzYq
         E0zqE5bs9WtXSbzj/pOzB2SDuyraDgMeNOZdfaP46dZPQTPnp0iPvsCorGuTwSsaRwcN
         oDI0fVBWcrPQxQ3+/XZRwXJMrvUdrnn0EMAfD3Ejvr0fYQDB+OhknfCyxya2tWeuRfG9
         LtQFTg6N+2dfFPme5Vn9GdcHWGZOmxq1DmEtaN/29o2OPXvKLcpkLvyoh+mnQJA8E9kZ
         UycvQstNIIopKCmS8z2FGrdAXpmvoAB161EpRrr2zBsrkPPHLOppUG7dmndGKDE6E6IG
         iVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509539; x=1789114339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYOgoHy9wmPlB6HPGaAQVHVyL9xOfEZSABUzx83Oli4=;
        b=krLxrjQnVcBqrNOQWW/1IMCSAuGlZSGHMRPqRtsG4MLZgOO/wWzIC98YLoiefYX+ts
         C+4iXF+OQVG1Ml6mpfQbLad1vbyQFM9qqRDY3nLpwbSJi1fdXeuzPJkuoeapNAWPj80Q
         H83Kzt3k/F6WPbe7U5RtUjKME4lChqGicRP0K36PDWMVdk9hjk7CqlvVrvuhpBIBnrfW
         4yInnCCywDGHL6mMykSxUvRfaDhtUwiQUBFnqNr1ZuTzZdDGF8yssa4FraNPUla5m8gs
         OFdNeu0IPndyR1IaY4BHFwr2/Rio2heF++Oe1kaPVsFmmnao2d85kC4Pc/wpANm8wWL5
         p29w==
X-Forwarded-Encrypted: i=1; AKwUvBzIhSGylucswKE52dKDeK4s6g0vwDQc09Bpw3SqYU0zpWZCC5XLgXZbcl659YHZr85v9WBdmvvimZe18y/kotXb@lists.infradead.org
X-Gm-Message-State: AFuF++kvkdnuLZLnH/p9RE3TBFx2MPh1ER+tothqYfN/fQnPgWjhiodP
	O3vun+i+xzVz0q66HeI/U/wBvOvUzKodjXOdla4wRTM/HN4I5tTbcumvJOKxVS9exx/vExyiCr7
	04iizEmXM9yYiv86zTNkV03hmi9unFCMrfhh1teuFN/tjrdulLhgDAKOIj5iRUGCdAEjaJDLSov
	Ch/w==
X-Gm-Gg: AYBFou1tju1JBbWBknnZ+CbLdFGnik4X+8Uc69Yi+X8oBnxgSMleDvaFjV395xAU9ra
	Ald0w8OT3lcX1CAOw8ZbhvtX2gEQQo4bJj6GoBDjEOTIFdzJV5Yjs528N2KrsR6f55RGfA2sXlR
	Gx+33tYUATuHNqvKD7rsm60rO8WEsppWe0vvLX3WDe2OzdaTOfRGDv4nAMf8y6QGDTcukfvKDZx
	G+oU88OisELUTKb13D4T9PYygUjeW5EzTUmBEeCBr+HFKXn4khmUPZJy9MWS33XQAegzslF73BY
	1BRzNMSf1g5DlrY6l2VqACf8saq2gbBK5NbF6+SisOyjTKhu7WCqRuCQtFkwjhImo3crmTa8aZA
	B4bZFWpGhj6fUAVNzeGdK7D4TTUZ2XwlEgORjum07mJrK/u+QVrfRIHHKhA==
X-Received: by 2002:a05:620a:290a:b0:939:ca4:4d5f with SMTP id af79cd13be357-939803240c2mr425009785a.5.1788509538968;
        Fri, 04 Sep 2026 01:12:18 -0700 (PDT)
X-Received: by 2002:a05:620a:290a:b0:939:ca4:4d5f with SMTP id af79cd13be357-939803240c2mr425005885a.5.1788509538469;
        Fri, 04 Sep 2026 01:12:18 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm71610666b.15.2026.09.04.01.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:12:17 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle fixes for v7.3-rc2
Date: Fri,  4 Sep 2026 10:12:15 +0200
Message-ID: <20260904081215.215528-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX9n9POjap+8/k
 OidUNQ7gfyQ/QyMvHrIRY2oMiJRm9qCqZozTuD847HuZjRQH9xOmNXfy5bzsNDpgl+89E7Vrwck
 aFKAWf5e/InZk6blE4tBiSWFPcMecmQ=
X-Proofpoint-ORIG-GUID: tAHjmbrlXjmoZ1tslNxw0gbydeSypFSh
X-Proofpoint-GUID: tAHjmbrlXjmoZ1tslNxw0gbydeSypFSh
X-Authority-Analysis: v=2.4 cv=T/S8ifKQ c=1 sm=1 tr=0 ts=6a9a7d63 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=mg6DjbED1CunOJUx780A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX0s4daFc8kaGK
 NW7Loiq1eKLJuodeL3SvLkVv4S0pzjn/6LG8e5ydvp0ZfEFEkiLVT4Y/R8Ch1K69HjElH1qLvYv
 GwEIOgIW1uwStED3ePcDaEO4YDQVb9p/fCTClwg6yaO/wcMBQeqK/pPyFdo0mpgr8Fs9CNp7mY+
 wUJQp6IXWP6ZdeGFrmBcdUvNhHpIIhEGOcXZjIA/RV+BZ0F7M4xGuquWGCg6dY54tNvym19sGif
 Xa3DFnejcg1YFYzbZGh6+izd+8X4Xmw3gul00uqRyd6XSnhV3xDjeLZy3sWi+lXI15ZtlIMAoK9
 YjF15DfQrl9TrZd26FajSw9dnFKc7hyEfQLotYzPPMrwQLMExIkKVbj4+iFxEBc7UWWz78Agn9u
 cOWNLG0OtcbzBm/n+a+L6pSLvsioiUlprBGh8DRIXEa6wQ3Ezeew8QLdZhdpdIpTDFfVcxbPSDU
 mNeKsBZWouxAEwDVJuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_011221_115941_09BB4B4E 
X-CRM114-Status: GOOD (  12.86  )
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

Hi Linus,

Here's a pull-request with a couple of pmdomain and cpuidle fixes intended for
v7.3-rc2. Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3-rc1

for you to fetch changes up to 2b0ac85512b7f67479127b2713254490662eb13d:

  cpuidle: dt_idle_genpd: kfree() the original name allocation (2026-09-01 17:28:56 +0200)

----------------------------------------------------------------
pmdomain providers:
 - mediatek: Fix Kconfig for Airoha power domains
 - qcom: Revert adding the missing power domains for Eliza

cpuidle:
 - psci: Fix support for probe deferral by dropping the faux device
 - dt_idle_genpd: Free the original name allocation

----------------------------------------------------------------
Abel Vesa (1):
      Revert "pmdomain: qcom: rpmhpd: Add missing MXC and MMCX power domains for Eliza"

Christian Marangi (1):
      pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN kconfig

Linkai Gong (1):
      cpuidle: dt_idle_genpd: kfree() the original name allocation

Ulf Hansson (1):
      cpuidle: psci: Fix support for probe deferral by dropping the faux device

 drivers/cpuidle/cpuidle-psci.c    | 42 +++++++++++++++------------------------
 drivers/cpuidle/dt_idle_genpd.c   |  3 +--
 drivers/pmdomain/mediatek/Kconfig |  5 +++--
 drivers/pmdomain/qcom/rpmhpd.c    |  4 ----
 4 files changed, 20 insertions(+), 34 deletions(-)

