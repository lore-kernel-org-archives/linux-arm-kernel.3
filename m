Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2B6C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Grmji2USRcszlNMGFmSZZQXZx3yzhaErBDzhawXe400=; b=z16XuTJNOdlvOZ31wqOHNvsDk7
	fJwZIEF3V0ZuJFs4xG2TxYX/f3h2blMyPvqUfiHPM+G+PeK66CW5bQAs5lg7yuBrfbNO1xudXtAak
	vvQ4OD82roWMv2B13rpTnYRJ4Vy9sKMrtqgtTHFdN4Kec2ZSyNhR7v2QbH0caGiHbXCd3vXYUQwMD
	ZCQi+NvEBrJYE1j5q9S188JI6dpdNd3afPm9KBF7v89TOHcIbFWgg/7riqdphFc611YBnW87L+/sl
	aaQt9MIDZFjj0va4sPGXfD5w7OF53r4WLyakrIRPkNAZREPqYBuEQuSVajtJJf54trIByqJsp+gxw
	cmhyllmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusgx-00000002m7W-2MKG;
	Fri, 14 Aug 2026 14:15:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusgv-00000002m5X-2lJ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 14:15:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDxVbh695191
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 14:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Grmji2USRcszlNMGFmSZZQXZx3yzhaErBDz
	hawXe400=; b=JNeFBHDVyR88UCXquPbhGQ29nrAOjhomQ5p5W2AXHDgJIorQ4/0
	ctk3Y0zxb42OhBlwKhjfJgguvDC/Lm5Hzh/rwytjWFSL7szsgn4fv7dfnOhEUzJh
	uPzr66DzdoBZr4rniRGWOdlVr+M4NVviGAZyvwSCmNgrydYYTYZPBgQHMW2lSUrB
	+NX1rsEaJnrSLHZ9NWpY1xU6tXREL71HNIqq0Qe9f3qFlNy8s1MUzPP11W/VRNaf
	8wORhIW82uvm0cX16+YPMAG7N+oFKyMdmfBUYwlL+4jEX5iSwVe1FNxAfLns/pl8
	S8m/FSLFieV6cDIY52RYaLyWjFURrB5NdPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy4rec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 14:15:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so14393971cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786716910; x=1787321710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Grmji2USRcszlNMGFmSZZQXZx3yzhaErBDzhawXe400=;
        b=XQ4oWf+JJ7LvtRuzVvPf+MtWHsrBpEfHf7H4IkEIvMIhpszpZ8EVBHTzOycYzNrWPZ
         0WrGixDgvF4MQvCS/0NKwcxczjVhufJdm9lh3gwlKUdot8IFbykHEnLJHJ6x/wSa1+mN
         XUymD5Wk2SXX+vrVuzmKg34X5Br/uJwpmVYt7rEeIX/L1mMsXaYwo7mfl7FwW+G6PdBH
         cJLfOE1kqfJe3JqzoguQh/BDLPJ3545eKwmmPbcT+nWv9KcF0h2UVm4ibYLfyMtKVWmd
         NGpFf7NlL5pJ01N3MBOxgPS6G9wt4nEkB9FwfrQ+RCX9lZLXu+wr5Lq1IQSO3m7Dzmgu
         XXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716910; x=1787321710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Grmji2USRcszlNMGFmSZZQXZx3yzhaErBDzhawXe400=;
        b=c+TT8TuO5mHiPuOA2ejiZH775GX1GYXDdSZ5yvtqHcM0y7mYF3gLtw0lbiItME2eg1
         Zoc0rvmXn0hLJVKaWCACznDFDKzCYnqGF9J6rlUPfEez1+gnRl+iTkHSObN+I8ssbNQG
         y9FbEQUAs5ghrAhSN4ZZCOc7QTeBhL8GuOkrp9zDBhvPCfDeJyyfa84aWNFvelT5+2ZW
         claEPhXAO8Le3GnG07thHTpD1p3cdHg7L0IWYPj/WrmhAnMJ8dG3CQQBW2cbP7FJnLRS
         uL6TiW7tQSjh6n8+q42+iXZiltjmnXmmzknJtK+DbgzU7Eplbe1iubPK5ZXhhLNJ9UbZ
         3n6A==
X-Forwarded-Encrypted: i=1; AHgh+RqBcMsbDWls+N/MigwG8nCLrpfV6027pc0UYInOWg+CU+G1h9sipzQChWk7MarvPcQSxNPmNJm8yegTOBL/RTez@lists.infradead.org
X-Gm-Message-State: AOJu0YxEtay6sZTQ3jHFw0581MN7oVNb8GZAO+i3HSe1tCZkQcqey1ip
	xi7opw48BS6mPLtTKlvUtyhqPNejyrhFwy1nGbgnA87BVMeTyOBqAMJKs9fQboAsut8H8siyCMN
	d95Nra3llF7PeJf/3tgFHYMrTMUY8EUlS/SSr2dqMX2RO5ileivPVmoSttz5A1wII1GIYKs1A70
	ez2k+wTPt3iw==
X-Gm-Gg: AR+sD12vq/91pDCI7fkCX01Jm6ER4GytzfvawP4PaimvxvGvfAY/dBPUvxnU0pg3hia
	VWEIpCfEKpGMkdaElaNYCQA+WVIKYyE1FqRnT8+xcn8PZVn02VzroH89/LOmhzsioMHFtXi+WNE
	5vKxmTJ2I7RZUYdvwQytjz7AfVDoQoW2++ouLbT7OjCmpIzJ0QSX2Xvy9aO/VjBPICxAHk0dbvc
	Tnd0ZWrWfBIt8JGvnilFUAK200T4B83/LDiSOhhqeeSvPunzQ+MtXaKFVICfHGME7CEXLssRzCH
	B0esc/Wqgyda2I6fledNTb5Xln1ZANEkJkAYdogmoOU252YLB3BfDZ+gUIQ5DAfXOkIGKQTpnDx
	lxU0pXONR/tdKgAYRU9SfF1q86IXvVivJbl392HDBBRPoyKkZ7PF3Ja3u0Q==
X-Received: by 2002:a05:622a:410d:b0:52d:7b88:dbdd with SMTP id d75a77b69052e-52d85488733mr74097941cf.31.1786716910144;
        Fri, 14 Aug 2026 07:15:10 -0700 (PDT)
X-Received: by 2002:a05:622a:410d:b0:52d:7b88:dbdd with SMTP id d75a77b69052e-52d85488733mr74096981cf.31.1786716909699;
        Fri, 14 Aug 2026 07:15:09 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2123821bfasm107533666b.51.2026.08.14.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:15:07 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v7.2-rc8
Date: Fri, 14 Aug 2026 16:15:04 +0200
Message-ID: <20260814141504.127436-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEwOCBTYWx0ZWRfX2jJNk1fxJKXJ
 8cvf4hGL3gZZtlNJxCsSKAcDwMk73gCCF/JtvUGA/Th10KzbZTcnqO+uMcKPqepSb7DqlwIW1B6
 TA+o6Bi7Qp7bDtupOQ+miC4InYLROEIySAM/sPb5F1GQ6Th+B0W7ysqJHKdNZV3NsO3ORRXbUjs
 OFkX+LMAwT5Go+hF6mxtEkobDQgUAcDI69+NwLczDZQxOvhulE9uGki7YCEs6+GrVU5BxAy+ytP
 dfhIyJeDOs0XQBejk29E1ehCA708s3KxW4x2gLTg3QN8MoxQZ1el4tJJAeTkT7e28PgKWGYNDq1
 rIwa1Gx1fzvFdbiLk8H+3FyczDZxYnZGCetIYzye4l3c5eiLBCFIVpLil1kqvfLOPEdJ7J8cvdv
 2JnZzNGIj86+WUjCklm9rcapc2rsLELt1okvYBGr5gZTuQ6vBb8BC/j19FfTFgpEmQHhrMelRSS
 /jJwakLehNEQtqAMMSA==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7f22ee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=eqoPJbdPTMY7M5JGM9oA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Yut9lRfdOr9e20llL0fsL6V2CMKB2HQa
X-Proofpoint-GUID: Yut9lRfdOr9e20llL0fsL6V2CMKB2HQa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEwOCBTYWx0ZWRfXxM5oTL3dDKQS
 sfLc8wSK5CrfNdTosa4nPOKAyTAYoMe0FthILZMa1sGSobPE/D4Xjh3mXUB3arUMenyfWMKRMHd
 w2D1JYwKLgoUBUs+fALSljF9PTWMpQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_071525_819696_D5000ED2 
X-CRM114-Status: GOOD (  12.72  )
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

Here's a pull-request with a couple of pmdomain fixes intended for v7.2-rc8.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit a4876f11aa1d076802676e23f8af500706e780e3:

  pmdomain: mediatek: Fix possible nullptr KP in HWV cleanup/on-check (2026-07-13 12:42:17 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.2-rc2-2

for you to fetch changes up to 090a95dbe13df9965279b588d97eda134831769c:

  pmdomain: mediatek: mfg: initialize prev_o in mtk_mfg_attach_dev() (2026-08-12 11:09:12 +0200)

----------------------------------------------------------------
pmdomain providers:
 - arm: Don't treat performance state 0 as an error
 - mediatek: Fix mt8183 hang on boot
 - mediatek: Fix potential null pointer dereference
 - mediatek: Prevent using uninitialized data
 - mediatek: Avoid setting RTFF's CLK_DIS before NRESTORE
 - qcom: Add missing MXC and MMCX power domains for Eliza

----------------------------------------------------------------
Abel Vesa (1):
      pmdomain: qcom: rpmhpd: Add missing MXC and MMCX power domains for Eliza

AngeloGioacchino Del Regno (1):
      pmdomains: mediatek: Avoid setting RTFF's CLK_DIS before NRESTORE

Dmitry Osipenko (1):
      pmdomain: mediatek: Fix mt8183 hang on boot

Guangshuo Li (1):
      pmdomain: mediatek: fix remaining %pOF after of_node_put()

Karl Mehltretter (1):
      pmdomain: mediatek: mfg: initialize prev_o in mtk_mfg_attach_dev()

Praveen Talari (1):
      pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state() on state 0

 drivers/pmdomain/arm/scmi_perf_domain.c       |  2 +-
 drivers/pmdomain/mediatek/mt8183-pm-domains.h |  7 +++++--
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c  |  2 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 30 +++++++++++++--------------
 drivers/pmdomain/qcom/rpmhpd.c                |  4 ++++
 5 files changed, 26 insertions(+), 19 deletions(-)

