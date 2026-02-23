Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9B8E98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vu5+kJ2KRuf7XSsncM4pNa9NRUl8nXTqYbQMD7by2WA=; b=FEfF+y+Y9oE7xI
	F6qS1+Z+QFAvLohmK8CkhvYbCLhwDGOGvawjZl1TwNuFvlECH0AaJgLUd0atS1kQTDZAGAR4GMBDj
	ByLJBcGrJdgme1aOxXnJW749mM4EJo+oJIBigZnK2vFyv9B9YU7eVl3EMG2EPLOj9Hnc7q2bNfA5V
	DbV/4aHnw2yKiYSEccb3C08pf1NSupUFRJbVIog0gl2bILiW9WjYQtLwcH1JOH6hB9Ueg/ZfylXHR
	aGRFB1PXVjSppW93ZkuSU4FiOrx+s+s6l2efifNqberPchl3lj9yBAaEI/KvWzQ9KNu1fwInyGwcH
	SOeFH0OJB3q0cf+ijYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnN-0000000HSCl-12rD;
	Mon, 23 Feb 2026 09:00:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnK-0000000HSB4-2ZjY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 08:59:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8o3mU2460514
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 08:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vu5+kJ2KRuf7XSsncM4pNa
	9NRUl8nXTqYbQMD7by2WA=; b=MUNbRl25lBIHci1Gq/e9uHk5NhTxlNl79mdEHB
	1cSDlPuuGnAnkHmC0IHYcUqv+QpAP6GXMi5LcVqoTpoVKq4QwHNHetp2B91OClcS
	zlcvILeVHzqnqdfGlHwT8h3RJKjPNqxArJNPkDmyScBEApiy2yExu4GULqaSjaXw
	Hr9SXir1O/GPsXkzaD1fjEij4E6DQAMibiBnHaH3B5ief0r2ln3o/gj7O0hCIQLX
	bQjClLu8SpDoHswJldsRNcdrxbKnXuOmOkcXgyNToXDEW9wI733h3eHYjgqloHjJ
	1Ax+P6g8Dhiq2A1Ehcf+DcyMqBLeGME2L6w2UT1TZtJhCEig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk4044-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 08:59:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8947c4398c4so546987506d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 00:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837195; x=1772441995; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu5+kJ2KRuf7XSsncM4pNa9NRUl8nXTqYbQMD7by2WA=;
        b=GnMo3UNe833RgrLY061O2hlcGAOcIwWeUTxS9IYvR57i2d+Ot0qxSkR5hYgQo+aN/w
         RvZdi3g7My03+RJ+HGlfmqSPOK1BCoqOEUcd7rOS8V4EKBz63sK5t2fSacT5Huit83HC
         +mYdCo6TCNCYf7whERdItaWk+zd3MkFkK/0B3wvxG4ihbAO8xjEVw99jOKx3MCXvYmG3
         7cgFJtQgNJ/AMz8fo3MxyUEYRqlSQufEdcVkxInOJo9KRvP42opP86ZOjPP06tSGcMj5
         sF5d6oMIEUFYr0rT027S24o2E16AXNVd82/7ri/Dfctb65fW6IP1v8+1jCz84LXMxVV7
         fQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837195; x=1772441995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu5+kJ2KRuf7XSsncM4pNa9NRUl8nXTqYbQMD7by2WA=;
        b=cqaWevLemvawqt5X6hshWRaN7jmXPu9KzmljWo+2EBHQrBRhZnhUSdBVjcxo7wq/6C
         WjsBlovwF823ykhOB7UHnk5DYmo0TwgATah4ptxl9VztR9Ja+vMLE5EMzVO3SIw37DXt
         ONq9al6+jjM1QcGT23kerGBoTS1Y92m3b/WgYng4BEGO36wwGRmNzKEhKZ0PvChVVCMf
         1HtSCOIBTHicyM6wMMRkT2o21padN4guIaMnX+1zgPkgeLcdufwnp9GJFhJ+tpQLK/m+
         r1uJOpDvSKPyumeQEej5DGtR+HuhUgORTSyvnTxtv1AGRRa1674tlLknSsQlO+xv6zVn
         uvCA==
X-Forwarded-Encrypted: i=1; AJvYcCWmIBq+cNQX6jPnnl1jg0GsZFZb46OITi0nzRfJb5zcx32AHlH3u1L791jypJSB/yQQCb7xoEA1KMp5UMqw0yta@lists.infradead.org
X-Gm-Message-State: AOJu0YxJhFarX8itdSeLSPah6GP4CfyCW/zu6G/hR5ns1kULHpWhmof0
	V/C631pdqhCfcncUFzQhNaaLJNChsvgGRYFJN6vHAd9tu3yicQXz5Hy7HZA/UrNJp/ChgETGd4c
	uCewqT71ZxdRhuLFZVxbk/RVDnJVNMovQ4fkZaQhFbbz9o1/0qqyLDu+KPkOXLQJjCctzk0zq4e
	XQ5A==
X-Gm-Gg: AZuq6aIgQ89tVXhX8IC/O+nbkcz9uvefoyFP6if6ScqKmC5w9EU7UqGjl3b4VwoyJ0F
	EoUNDUnuns9P9NlZ8WaexVoigWyEoZWWGKQF7cQnJVBhMAovBBW+x9LGvsOWv07wMtOEFXx8Vdd
	ObPEiOJ6I9zJazkEx1unDr64E8HFs2MMSWOSGBfqLtzqRLHm8Bu0y/czHFBlENVrgGAEzFKIkjY
	XbLjSRgd3IB6m+v5ND+Lb/6+3of64JDUhtyYGs7CbjgJpc+TE3AkCEY7kw0Torf6OkgtyDUnH/E
	VsSpBTu9Tsv83+mTbw1DU8F3B6AKzDM+faEAgf2HVhJqLHs9y2F9YSstm5zXbV5jQ2WMtaDEdKy
	HiEJRaXOmBYvJButeJ5bO1WwzpFzai+PaQ2ce4lD9SFBTlWpt0TnK
X-Received: by 2002:a05:620a:4416:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8cb8c9cdeeemr899729685a.8.1771837195588;
        Mon, 23 Feb 2026 00:59:55 -0800 (PST)
X-Received: by 2002:a05:620a:4416:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8cb8c9cdeeemr899726685a.8.1771837194998;
        Mon, 23 Feb 2026 00:59:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:59:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Date: Mon, 23 Feb 2026 09:59:29 +0100
Message-Id: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIWnGkC/22NSw6CQBBEr0J6bZOhQfysvIdhMY6NdAQGp5FoC
 Hd3JHHnppJXSb2aQTkIKxyTGQJPouL7CLRJwDW2vzHKNTKQoW1GRCjkcAjSj3dsuB04KNryUBe
 FyZ3dGYjDIXAtr1V6riI3oqMP7/Vjyr7tT5f/000ZGixKa/a5KW19vZy8avp42tb5rktjQLUsy
 we7dqc7uwAAAA==
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
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3499;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VvG7vd7fZWSAXv6PdVUXds74cvD+b0T6Unx7PuBmRnc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb3fG3CwNJ5M/hqqSYT43XI8trsoU1YEeWt3
 Kxjocc+Vx+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW9wAKCRAFnS7L/zaE
 wxkpD/9RhvfJv3ttEDXAr5ioS+xTqbBT/5fiaxaSwFIZeJ2gZR91bPruhA+1jSyV0rb7iB3dp1x
 hnZGjJ9fxV1Fy4Vhf9la6j6kbkt2byhBaua8B1h27CzDQZxi9LLUHYTUH/AegRw5GVtSv8dmybn
 daYh1LYZItCUKjucKFGeNH3zJMeWpnpa9qhYjq6AWFWCf68SetWMt7/lFDnG10eh5NAcMjT2H3m
 EoAu/D7sLQ8ADCiFNVux65KSZZ2jMTuDOWQ2haWCJjWO+1bNrNtFn7Pb7aAivIWnLRfck9mmH6i
 EgXwBu+yuO0s3JIDAvdDr0iCt4J0xkXCidF15elPYth67L1H1GwbsMStuSvY4t/jryayd8jY/x0
 Ruab1IgXtRrRFwfIWjsjTXkTkXMKKE0IgtIquSB2KQMHQFpEF7HGCilnjRVAT19GvwLVaYHWMh6
 VG24DSSR+aen7xI/S23yArfiEaEBiIPn8s54a0BCIkKQdWQ177nIgKDDS20LekvqZFwQoZeqC00
 bJ/VAJrP6jOqL0pKu+2XLbv3Em2SMjZ8VXGMKj6Y4NKkmDmE9B+V00GpZM/S/nuwfStzjF1+nqj
 gGn8Hon0035YW5EZRHQvYVWhqQxv6ThLBvqaN2lA60105wjKRVxQ3cl5rvHVmwmTgCjqSjzhTIO
 KwabIv/iYhBFs+g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c170c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M7r7wYDzB2Ki_6CY1cMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX9jqNX3Dp/JIa
 klZl9rILbKYaDcdvgc4R+8twrg4LK5BiVVtNy9VUNSCbMYDQHOT9F90lSMyVVkIXnwCyQPh5KN2
 7qD+4gkC9On9AWjEYl1eGI9kAUis0jqBNXyloGvkfyngHzrupUs0yawxN0EbxoUL8RImJeGVrYB
 FXqkqMot0QW3U3ujJvR0b+Ldvdy4VhW+/dkqDU1PfD7JwYRmSp2wb4b3NVVJOAJV262j8k+UmkO
 guFn4iIkmjvkXBu8GgLExaS8m2OsxrxrRXUOvIBg37iBeoIOyBGsUewnnG8wfm/n0ofoRF9hqCD
 0CV0Aexvx4mBRWt5meS/TuUojvix3aGisaUOaasOw4+XJPDdedRbvnSf7xecwQ2LPSdxTh9h0gZ
 o8zy2uwTcgcKGaKIPhA8zkqgQjni+qiMBhcOj2uy5GPHA0m3RzCUUqEx4Z0I+7EUyJxk4elv603
 51YIk4WGDF0pOkMGokA==
X-Proofpoint-ORIG-GUID: Njkv1Kh70EXJjxadH5YOdM33DUHdSeHz
X-Proofpoint-GUID: Njkv1Kh70EXJjxadH5YOdM33DUHdSeHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_005958_697879_B6C54E68 
X-CRM114-Status: GOOD (  19.88  )
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

Link: [1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Add a patch renaming an existing i2c_dbg() macro in a media driver
- Link to v1: https://lore.kernel.org/r/20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com

---
Bartosz Golaszewski (13):
      media: saa7134: rename i2c_dbg() to saa7134_i2c_dbg()
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

 drivers/i2c/busses/i2c-ali1535.c        | 20 ++++++++++----------
 drivers/i2c/busses/i2c-ali15x3.c        | 20 ++++++++++----------
 drivers/i2c/busses/i2c-amd756.c         | 24 ++++++++++++------------
 drivers/i2c/busses/i2c-isch.c           | 32 ++++++++++++++++----------------
 drivers/i2c/busses/i2c-mlxbf.c          | 19 +++++++++----------
 drivers/i2c/busses/i2c-nforce2.c        | 14 +++++++-------
 drivers/i2c/busses/i2c-owl.c            |  4 ++--
 drivers/i2c/busses/i2c-piix4.c          |  8 ++++----
 drivers/i2c/busses/i2c-powermac.c       | 26 +++++++++++++-------------
 drivers/i2c/busses/i2c-scmi.c           |  6 +++---
 drivers/i2c/busses/i2c-sun6i-p2wi.c     |  8 ++++----
 drivers/media/pci/saa7134/saa7134-i2c.c | 26 +++++++++++++-------------
 include/linux/i2c.h                     |  6 ++++++
 13 files changed, 109 insertions(+), 104 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251222-i2c-printk-helpers-a69f4403ca70

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


