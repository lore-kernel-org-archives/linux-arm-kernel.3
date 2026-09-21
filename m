Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BECC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCgFELu6kIfcPsQKoSSTfCHDAyLCU7hgN7NBMBE2YJk=; b=acw6daa+YYC6DqnlN47H6EzJWe
	9udfXzpsQYdk1J6slWd5lGKspdzM27rV2lXByZze1Ns5NouWlnrJJmSX9ix0Kb0nsd0VgPXDvhOsv
	Ptx9+YfbBk/9ICMneh1IzxNmanwBHIVjYKdphqQFx0h6tLfmc6BC9NVjDYXcJO1h+3PshsgI33xmN
	154RJfAXcvpNKSXBDDl84Wlg5LfTuxP+98rrJTRDaF6/Q6c9SEJ0gUGQkkp5lcDw5jKXIauRfIORk
	utb41x2jEPmHAOffptGZb+WttjWAm/6k2immEYum04IQqq8GR09Xsje1AiWMGuMm90YgWi/UL4OcB
	jTKakp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lxV-00000003VnG-0bJj;
	Mon, 21 Sep 2026 21:53:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lxU-00000003Vmw-2AN0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 21:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nCgFELu6kIfcPsQKoSSTfCHDAyLCU7hgN7NBMBE2YJk=; b=p9vSkvAnz6KVaolWP8OISAeHbz
	dQR4gStglUBQ8JwlDIt4sx0xa+yOIfweeLyJivQ3707B0YjD5EXV2Mx7hnG3d69sk10Skt8CWOyXF
	Ms7uEx/nWLZoKf3DMw8nHBhkSg79ojEW+PGmI06AVbKHKfO8TMBihlSlsLptMSMcdCZK4A+b5637Z
	OmTFb0P8Vg4NGM1ZBBDEHuXpNEAKhKE5cfqDhfRBlmdKKYYyIOiSyIyyntFpgB8o74/+EcCQJBDb6
	kepnS1e/J1kL7+bBEJz+Vod3Ci45yiqwwxjaQZURQ0JtyhkxMOjA80gBG+5aq26t79RXI0GNruxig
	uEJHgXrw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8lxL-0000000CrQr-2fyi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 21:53:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKf2hD1614289
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCgFELu6kIfcPsQKoSSTfCHDAyLCU7hgN7NBMBE2YJk=; b=Sfrlc1BhVwMkzGmR
	cmMZ3BWRONujILmAX4IVDq7hZ6g+YoOsnH8oDCHIonpP2TydSD4fCHiGcWWdrQzh
	mh2bS8lWSBe8zVt0Tzj5APVjagbBv16VVRG4Ecep0ObquQhVCt8xKFxg+6tJYriu
	ZqMNSeUKkzOKklnPU3g0qsD7XuwuFKXubSS1Lp6hpGSd7DenDSKPpfkDSf4FTwBB
	6gduSi7fZr/t5ouxzILhAyv9Lq2fUy5i/9b7XBlTwM5NlX0G5mJfou/qjGn21rgq
	c1HrR6k0sJl1r2tTufr/9gZnF6qffL6+UgL6rwRhyGgyGLUSOvkqpmLxNnEWmYbF
	IjPzHA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj3b5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:53:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f75c1219so74588195ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790027622; x=1790632422; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nCgFELu6kIfcPsQKoSSTfCHDAyLCU7hgN7NBMBE2YJk=;
        b=GFRSQalH64CKpRjwXbXEhLyy7Ri9PWEB6pVwGKEi55sWPncgk2nTeuJQ59w974w5jO
         cPYL5z8tbrlUIkv+r2JCe8QGALaZTOfcgQnKSsun/NxVv+LUoZnQH+j9tXjeBoCMa9zq
         rQRfxN8dcZfSDW1QSiJQeKhz0q3LkvTZlAvzRXwvXhkQFNLpErIcVT6y2K2ExMS8XKCs
         NHt61uDW5JLORGY+QFjLv6CYwXh6y0KRGb/8oeOOP2pwStGuKt/Nf588ZgMi9T7WEJEW
         5dAUlcXCbpsrcmMkvnybCIcN5zJ8ZoDJS3OoPsX+IhutiQ1F9DD1H4II/zkf9Ve19qpU
         XW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027622; x=1790632422;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCgFELu6kIfcPsQKoSSTfCHDAyLCU7hgN7NBMBE2YJk=;
        b=NuWzcy+cIIRFsv0p9hohRMA+pjg4Jw9tK1Hb26EkFfU9sd/ZvwAkZ2TtvWeZHPerq+
         se/va7TB7WFAQHFGuvroeSFlc8pkHc4vUwWPH85K2hExgh7fK0P7r/tjb5ePQmGQKCP9
         kUjKAb5uy6Mf+veHsEYlhuCXtxABDVf5ryFpqCjdqeSMtJpcbuMZlzPe0lm8xbX4jJb/
         2CQcUFnoJAlrP2KKPpyuNLQZq/s+ZxDGS+Yj7oh1BZnr65q59YA7JOSkoOkrmV5me3i2
         IZ8qFcGeZg/LO7wIGptcfbGvHI45kLOcCyAirlFMeQ0mKhB948G96XwNsTEaGHYVTSxB
         CXPg==
X-Forwarded-Encrypted: i=1; AKwUvBwIhuWdRi8qd+bIQQS+qMXTBjHqkwblAK/T8EX8ntW27ksUgdeo44gTZ0Dt1FnIOTCU2/O58pWBJ5zKnF7COwip@lists.infradead.org
X-Gm-Message-State: AFuF++myYrtbGsdKndAFlOQ2fddKCer1eRoboqcZddZaczBcfLM4W5Ko
	rRbcr8cbXkCoOU+ZjrRN2Fg3eqv97r0ZO0FOZFfRFj1i3OPIY9CvpvlCdtC2IUZxaW2SWoXiR2O
	GWaV4vBFQZvfndukCJzaGqLSYYVcviGrHmGpvguYmYKnd8WgjC+0wlKcHyp9O0HvhRCyFZH0xgH
	n2mg==
X-Gm-Gg: AYBFou1K0IGpWoptw5Dv5HXdT/H96/DnjGPHLDa25wfvBKzkVEVB8fc6jNk9ZJVYa1g
	P7fWcExLYOI0gr930m6VQdloUgV1V8/TD9NRgh8e5LDMOj9CvE4yhp7lrhpkfBSLR/0iKAVuhzT
	BJa1NgFZI1tCSi2JcF4HTMvcf1JawCbO+/c6EPFX15WF1EhWsX+8x+drfFMvrEHh2mLT7QoX/kn
	pfwmOy0rnqeJUy1iHX+bXchuFO6vSAi8hEJlhusREXQ/YcLv++ZuuJrDrf7Ko1lnL9KVEELP2jc
	oFr0W/+hIibt0zzmbhm7TwgqR+iH196+LceQWtBUvLyTxOQrvWdcEKQKTvGnPzpVNE1jQ0wHmmQ
	pUPdqmjoulXQZh/3sJzPpBYS3gQ==
X-Received: by 2002:a17:903:2f89:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2ddb1b1190amr169294075ad.13.1790027622368;
        Mon, 21 Sep 2026 14:53:42 -0700 (PDT)
X-Received: by 2002:a17:903:2f89:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2ddb1b1190amr169293795ad.13.1790027621908;
        Mon, 21 Sep 2026 14:53:41 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec16d09sm710143eec.23.2026.09.21.14.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:53:41 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:53:38 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 0/7] firmware: arm_rmm: Add RMM v2.0 base RMI
 support
Message-ID: <20260921145338.000070e0@oss.qualcomm.com>
In-Reply-To: <20260912083611.2513845-1-suzuki.poulose@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxOSBTYWx0ZWRfX3rgY3s87YH5d
 GgqzEfy75BmkELJMiScOJP1UXPmTBHRoECu6Ja5cHPYO275MvLbQClqJJhco+LgWEjwdNbo9Tqa
 MzfHbe8EGR7j9EeN2QICCO6B0BxQ3bk=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab1a767 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=_lSb5bjROgHUFZFBuPEA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: RpZDwGRSiyw9c38EW2ey0jaEbHIbxcB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxOSBTYWx0ZWRfX/n1vFzLtaQ2W
 9/+M6AdOtH+VRQWGcN4DEfMY0kUO1n7p4dLVykGHeQRlJNO5lJVmavX3iwf4xT6z4dUFxfLvJaZ
 2JrboTCu+t5UNGGPOVD+f7EJ+LT4ki9hSzJEOv2iuGWr+719/6CmWBb6Kww0ghQLyptHyYInlbC
 EKuEdS4s1dIDMd+a1cKgwzqUNbNowvtZDNDaLXvk1NhfZqYWqcVNQinoy8EUGxzlEh9MopKwpkb
 lZsQoRPn5MrJkYxVYt7F+dLmeooAL5QfSqP5LW+90iQTPTmpWF+PC2m+dUm2agr3VtKvfLhfnPJ
 YKsKiE22hbLVjyu2lhfZOcPZXP3R/hB3Zn1LHwkZKa1emKmfJK8jk0u/QDCGecpbtrv1m9yZcaQ
 NXlTzyymUJeeiPBZ1DUaqeKhRG5pBtc9pBXDiClKzrN+zmzIA5PqXU/H8El7d5B/z23c/QVneGi
 acA3V5PWXv9EeDhLtCg==
X-Proofpoint-ORIG-GUID: RpZDwGRSiyw9c38EW2ey0jaEbHIbxcB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_225348_374411_7F1BEE5F 
X-CRM114-Status: GOOD (  10.45  )
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


> 
> [1] RMM spec : https://support.arm.com/documentation/den0137/2-0bet3/
> [2] This series: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/fw_rmm/v18
Not seeing this branch.  I wanted to sanity check on discussion in the thread and
was being lazy so didn't want to check out the branch I built for review.

J


