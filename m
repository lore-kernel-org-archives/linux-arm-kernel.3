Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CE5E6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lVsiiqxounOhFt8gtSCLzipaRc5xfLwpGpicl4jLsa4=; b=ycO149XuCmEYIa
	6T1HaHV9ZBN5ZPmGW+6XzvKFp8Je3W9k/YXaMEN6NfJ56YV5Z7zUmIFm9v282FloSn/lWn8BAFS4k
	q126Pl+1UyBLgto6czTdCeak2MGFKhXN26jomwOiciD2JzzoDBTrhz7/0LqAa3ByUiN6CEuOJMpUn
	lbhRxn+B47NklZNYLQHhOLZLL7Mzja+C+uyv+NGGmv1f9CD1vIIT8+m0cy15yQp8JzLfLDGC8PW1T
	iendz0NpVTzdE3DiRnfur7pLLW/qAtzgEl0Eg/edv2UhEK3a1mZYhjEqyz0a6DKP0svN3M2t0Lf+f
	zsMh4dX3K/bAgpRSJSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzE9-0000000EoLt-15q2;
	Tue, 23 Dec 2025 10:02:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzE6-0000000EoK8-1c3A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:02:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN89SKt2747756
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lVsiiqxounOhFt8gtSCLzi
	paRc5xfLwpGpicl4jLsa4=; b=WDiMJ4f55N7JCXL+Mw9JZgABD+OR70NFiCm7PA
	31CrZ6a49X2RmnUk63ssf0Eip02NmxEy5pQI4vDGWfuvpeM5Alv+pcgXeDs9dT+z
	O6wtM3s4itQd1KE9/A9+OpljdGeE695oxgSONLdtngr78tPn4jB8xx/IRV6H239J
	45qpJCB5YcVWYSMMnOcR5ArHvxrzGbBIn7i4Ml7tn6dYOAlp7Fg6hzMkplhmwLpM
	JXCT+R+jc0pFlXd8R+4h7jMIP9V8tPNxf7QmphF002dxJAjY8WNMxiQeTKMGx3es
	TW5sCKD2GTZyZF8doXNw5iQZ6OQSY9Ch4kPb0q+IZ1u1jZjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5csn5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee1b7293e7so169733101cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484165; x=1767088965; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVsiiqxounOhFt8gtSCLzipaRc5xfLwpGpicl4jLsa4=;
        b=FCdGORddnQ6jrVLKf081yr+fh8G1xKrLKqk2Px/fW1qifd+pVCq4b09zU/ogMs4Qco
         KZlri6ROr8xg/0EDdAGUortsPZTbxQqGjpJZVx4sGphDAgkaEXaY9ReriXadBcxh+obl
         eN62Er8Q/Sg7khXmOfP+pirIQeMXyEQ4BdHN6LAC0YMtfV7XvVDh/iHXcERTKqZx0lQJ
         48hMrnqmLECSCnBmSk4jf9XyQac7EQJZcJPb3WSRJ/n6Y77L/dmUkpZJ3NJM9fvCckBX
         P7uk24yUow9h4nHlBOJdbVYyvWS6SLMEuL6gk9Rv+VTvLtVp1Vx8FOceo7mJuEyyHFXA
         XFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484165; x=1767088965;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVsiiqxounOhFt8gtSCLzipaRc5xfLwpGpicl4jLsa4=;
        b=C6DDgbHcEk8AkKf3nRsBK1JV6cPWkSmhoH+6cTeLGd4SbTlvRUvCdXaEcmWJXr9af2
         DIiaA3d0LBIG5Ce60X+Pt0nvKbdfHqb2ZZ1B9HOzpKLha8maWs2J4EoBpL/vgPR/mk3p
         2DQyEopJPh7gXiqDTq8dMLU6H6cfrh3tSBxs8xQKiz1W0AObGUNTn+mRpzD28uSptw2k
         f+R0cDqEORHOBNKT+UCGVm72uA90Cybvuu43ZkTNz1pooFf2kKgdRNWyMGDNC1XOKRBR
         nQVefz5z+vm53QVSIVrKc0lvAhA8kkGStEHk3aodZu2rE+p3OhK5YvzKAf3jdl/S843M
         5mgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+bdYe3VYsx4k7OA0B/VXn57WWEvdfgTZeaDPUikL5ACkFoYmtjAGdHTPgS4a7l4ZLqfP+kZ9S0JCzogzztJGT@lists.infradead.org
X-Gm-Message-State: AOJu0YyHBAC5M4Me/VCxKe6pylhnZ80ICiJpf/YqoOgkp6vG6238aoKf
	4SSz1/75trtqbMNIafDQoTM3qQMIwbJZi4lz1j0/5JPC/3re+Kc50FadrXrUc9CC44hRDbRXYai
	yc0IU37rWwKyjhmOJDf/ttStHHhWOm4H/+QWDGC0CcmTyH0+aUB2cMqMprICnUgYN7uathyyhBI
	392A==
X-Gm-Gg: AY/fxX7TwhXBi2wjizrKrBcHPAaAkbB55lYxD+fRvb7tBMxnEqrIKfO9WxMKjcCkp3s
	+Ur7WGhwdSedUKMfUVsuA8qNks0tBvkTQRAJ9zfAy29x7r5vvF4V3dAA5ccOaAMY4QaIVf4mZEq
	Qh5cE34Dzqf0N8nDsymCy/2Jj39RXiOf+eLFrdeUyXzrBfWTUiQBkTuHY7lnJVbj+/VtB6E/Sbu
	iduDsgK62jh0G2qZqy3gFFPIJp1NhAy/7V7g1618qzdf6RYiNmMW9LDBnehbKI6FY6g7i9f33Y/
	sHv7Sr+GX+F0aAXOYR9xytsGEXedRDOwbSgnY9x1frEntIt9ywmsuMtGqFDscx6m4YDjWm7L7Yo
	ZouvW0LHUQ38erjwN3lOaikZ7gbtSjs0/TsX5jg==
X-Received: by 2002:ac8:5845:0:b0:4ee:14c3:4e6e with SMTP id d75a77b69052e-4f4abcb89b4mr199518981cf.2.1766484164792;
        Tue, 23 Dec 2025 02:02:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgOAvppFe+utmVWSJc5Fi7Osfe16Ny+TBuzlxFntilRe01w0BA2HK+q0XCwAWBLR6sJii+LQ==
X-Received: by 2002:ac8:5845:0:b0:4ee:14c3:4e6e with SMTP id d75a77b69052e-4f4abcb89b4mr199518481cf.2.1766484164162;
        Tue, 23 Dec 2025 02:02:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/12] i2c: add and start using i2c_adapter-specific printk
 helpers
Date: Tue, 23 Dec 2025 11:02:22 +0100
Message-Id: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK5oSmkC/x3MSwqAMAwA0atI1gZq/KFXERelRg1KLamIIN7d4
 vItZh6IrMIR+uwB5UuiHD6hyDNwq/ULo0zJQIbqgohQyGFQ8eeGK++BNaJturmqTOlsayCFQXm
 W+58O4/t+Rw/752QAAAA=
X-Change-ID: 20251222-i2c-printk-helpers-a69f4403ca70
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mwDZA+PNMAadBUbyVdbpUvC9ahnB+8CAzRi/TqPVUr0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmiyrwadEPSafSYG+ZitmVmW9YHm1TBBa5m3n
 aBg7Itr6lSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUposgAKCRAFnS7L/zaE
 w7lCEACFwc1erjteHjPbCchFkjEMwie8N3o/WH17ZxwRtvpaSLRqGA0OTi8psX5Dz8P3MxWysrg
 QTcJvUk7lt2X908rAsTZaJJ49baytToXbX9qx3i3dSUwpAibeeksU9Nmhtbi1+ty8L9j7dzNzN6
 yZBh25hLS6xK5SnJLPe11uY0M517V+7MvPtObQnqZnB56iG0hvI4E3w5WSbmzfvAPG24KSQYMqn
 BTTx/OlmcfwhULH+UHPyIcLvL5Nnz243GpwRbKgXjA+ErHh7ym2Och8IAPhQCwMDJQcUNsIu9se
 hX2W54J9zrM9DjASpJh30ECj0/FKJSN2NvrXu0vAVcm74LksPFfJuvNk30Aq/nmA1zPIYaJrVm6
 BwhTUL8zyWwMsYiu4tKuDP/t+zsFWfvjbDBqMh4x/8mpWQblzmpytqCud1GIrZc90KJxgZU9bdG
 ibCw4xwFY+GWFyHCYg1wvcZa38xPlQH0IYrmkb/ZBvhpSZj3N8+672ZwsnvODeOJegkufYNhunx
 DGB0ZpgJbUpNrY/z9YGrcXW3Y/IKO+grB0VzvNE3WEW1kYnTYZI9RU7ZPI0R5l7WALlwW3u7xpn
 HWlTHkmI5GG3dZri+dZG6jH1RADUEamjmOZRPnPJltogZNsUmV6hPLPJnQ3VneAJVnzpjhxbLUi
 MqCv6TWIcl6iAQw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2Dmhu/pq5a4P
 rUI1p6n+gUcGBwFSOZPzOoiloLcQeBZj0qfmzakj77f8W4M9HnwJDQKe/MjIV7Csr2pQYeqOwNe
 xVLjSPZ54AZ0W7cLuDXkevdJqo+II4zkA9mo7O/izQfqGmcMeOGGyBL9ee4UK9ijTuQwoOC5kVf
 cCEhQMC0g015NFXfdyhVi7v7zSq0rAP+ofSrjuttZ2Mwmi34OuZVXhwv7HXwLNz7RerwAKF04zy
 Bh1h3f3J8Bg82Kf+xKyBQqtR8s5HKBabntWVdpt+HHUgty8JMDU0c/sheV7GjoKkywxi+x3BYiW
 YTphAmx52GfDmE9uHsfJ/HjVzKZT1V4HY+6bqw9F3DJa9FqJyfSbVzLD+LqvMJkh+fZnR1TckT/
 W8OEH0t45APjMKZWIgxO0Ml5kp1OdHjeiHKPAJbM0q5jNWGI2HaUBXNHZmiYcK0rsHo8S/h6Jay
 6AMxed77hnn+PimBFNg==
X-Proofpoint-ORIG-GUID: nOVCf_kFc3IJXel0Dh-yCx1R9o9T2XO0
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a68c5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7r7wYDzB2Ki_6CY1cMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: nOVCf_kFc3IJXel0Dh-yCx1R9o9T2XO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020246_467333_58EE18EC 
X-CRM114-Status: GOOD (  18.35  )
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

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

This series addresses the usage of adap->dev in device printk() helpers
(dev_err() et al). It introduces a set of i2c-specific helpers and
starts using them across bus drivers. For now just 12 patches but I'll
keep on doing it if these get accepted. Once these get upstream for
v6.20/7.0, we'll be able to also start converting i2c drivers outside of
drivers/i2c/.

[1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (12):
      i2c: add i2c_adapter-specific printk helpers
      i2c: sun6i-p2wi: use i2c_adapter-specific printk helpers
      i2c: mlxbf: use i2c_adapter-specific printk helpers
      i2c: isch: use i2c_adapter-specific printk helpers
      i2c: ali1535: use i2c_adapter-specific printk helpers
      i2c: scmi: use i2c_adapter-specific printk helpers
      i2c: ali15x3: use i2c_adapter-specific printk helpers
      i2c: powermac: use i2c_adapter-specific printk helpers
      i2c: owl: use i2c_adapter-specific printk helpers
      i2c: nforce2: use i2c_adapter-specific printk helpers
      i2c: amd756: use i2c_adapter-specific printk helpers
      i2c: piix4: use i2c_adapter-specific printk helpers

 drivers/i2c/busses/i2c-ali1535.c    | 20 ++++++++++----------
 drivers/i2c/busses/i2c-ali15x3.c    | 20 ++++++++++----------
 drivers/i2c/busses/i2c-amd756.c     | 24 ++++++++++++------------
 drivers/i2c/busses/i2c-isch.c       | 32 ++++++++++++++++----------------
 drivers/i2c/busses/i2c-mlxbf.c      | 19 +++++++++----------
 drivers/i2c/busses/i2c-nforce2.c    | 14 +++++++-------
 drivers/i2c/busses/i2c-owl.c        |  4 ++--
 drivers/i2c/busses/i2c-piix4.c      |  8 ++++----
 drivers/i2c/busses/i2c-powermac.c   | 26 +++++++++++++-------------
 drivers/i2c/busses/i2c-scmi.c       |  6 +++---
 drivers/i2c/busses/i2c-sun6i-p2wi.c |  8 ++++----
 include/linux/i2c.h                 |  6 ++++++
 12 files changed, 96 insertions(+), 91 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-i2c-printk-helpers-a69f4403ca70

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


