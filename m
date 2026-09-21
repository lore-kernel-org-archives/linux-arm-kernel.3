Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD00C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Swt0YNhB50FD81oDu+eeGBpzGMZ5gYqJP471jCzHYIk=; b=ZTDHnpsoAMzXsH701duipvKIVa
	wqWzRnz1dZ6FtXBIZvoVdKT7wv7aZvt4kMurzJiLaPVQDz3MNsISsQA/9L0cEY7xMBvC8xbjuVvsa
	LoJ0rwGsndwG7Eah5xLJFrDo2jNoBcXMkybkfLa3QsZijhF4f+5bnwBg5XNe3KZdvQ2FYBiCPrhDt
	ZYpeVSutl/9W25kYn3nVrPWmtRfMAX2mPlnXuy+mfShoXGfi7YI/M7p9dAetazt+Bwz5W3nxCN71U
	9FRRpoEqc0mXbpoiV7GuoFQ9XqTqQ7+V1R0InZIdPw67C8kGqW5PtAnaC1vf66LufWac4K5xJ9rEm
	exMUyFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lhX-00000003TqQ-1LXy;
	Mon, 21 Sep 2026 21:37:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lhU-00000003Tpz-1tTg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 21:37:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKe6cF3423703
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Swt0YNhB50FD81oDu+eeGBpzGMZ5gYqJP471jCzHYIk=; b=crwk3eZFEJnuHuwA
	BxX1kqi8xITwzyLEXrOfDs9Hftiy1udNkfXh1s9EoS9FDMi9SYYra2hr/LwQMuPH
	kMlwgDt70V9cANFNiAuf4sNIShxrP2xTz7dV0eAMRZIBCBHgh5tKnigxbVhBm4iv
	W4t9IZd3gJA551FAz5yi2qOckuGgI9N3N8h5rUFAgWenLb8pVjTLmbX8XBA8qRSS
	xpy2rNyF96OUBBEDD9WZwHg9nbH/k4P0xWLhfXzD/R/hQsoN135rLUS111W5+VpF
	RkOszKlROCP7sxheX72VT4GUcGfsSaHovQBWU5lbEoVK1R1uUT6LNq+Ulg9qLZ73
	sZCHpg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v50xnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:37:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9336581a2so59911555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790026643; x=1790631443; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Swt0YNhB50FD81oDu+eeGBpzGMZ5gYqJP471jCzHYIk=;
        b=a1Bq/CATjG3RmA8iJYgJwkkM0pjfwVU144SF+p0LALZ9qCTuB7Ulok8Ee9e5e5YX/H
         Iai+90ouWZt9VwYRz4rEUu5BYPU8ett8xbAp+3Ybvr4cvvnSFST1kjgxq0zu+O2pby5N
         V3kZR99djCHdCoMdvk6xO30HgvCLpbPJasan8/3rnG7KCqU8WcyygEei9h0O4m7NaZ+2
         jS+IoF5/G3XWCZM6kLrNkCAMNppTzTm9Cz/dEu8jP6NG5JMK0Ri7zbaX0dTQ3HrXaUGi
         JKk1B2i/1ZpgHUitU4DeMjD+9PV6aRZsehLHb+mA9fG62zMErynVOXYlmjo7ZU6M70/8
         5dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026643; x=1790631443;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Swt0YNhB50FD81oDu+eeGBpzGMZ5gYqJP471jCzHYIk=;
        b=xXbjF38qnSv54bOyuFSRjlvDwtvNwy3GIjWPDXq5txX8GaV+2FfbTIk7MQDo/+br/l
         7FaYBvteMac2Xa5MjOYbElD2GKqXWN1sf5EGAHgXcxYYwxmRZRnXZKSRXI0Xx7IrbB17
         PyvXp05S3hFnAyqXEc8UnnPU1aqglzcfOMVziHA52sfUSY8j2Xjc4UHiI7tnhInSjIGe
         adPL4kYJMyj5GijhmLZIWERSX8/bTODYqLXEUcMZNzW/4XDyrPeefZPxmP7Q0aJhsO6R
         LfndhOqibo3d6tJ2esqUk73VCmzLsL4TVTcm7QYpH1wFUOnmbeKF5mkgLIi68D1UYOyp
         HEOw==
X-Forwarded-Encrypted: i=1; AKwUvBwFSEBodO7MVrqAQblrQMMgZSDHTJqoT4Qbngf7xRN8ZPxjd8CD+eAUrZbFwhIO2iR3LqgwiXtlrRp3qbtifFM6@lists.infradead.org
X-Gm-Message-State: AFuF++mwrLnWTqHa0Zn9CXq2xtoNS0i8CalnMezeJiDm5/+VxgoEi6R6
	39xVmWPl90PSg7vGH9hI5KxO5pYB2biNDoA0CJmPGbgIQOidFAkBKkfMqT8rHcHmvk2mGVBDwqn
	bUCWo6kNCY8uzJseK1SKeVb/E94ypQ+J4gPjbSjp67IQvOO190/DFspvBx2bxXY7XJtrfzsctG/
	7ylg==
X-Gm-Gg: AYBFou13MDnCNVFuFxe4DdKLIBX1wkjzmkvviQIMH66HTvTOo6bAYRsj6fokgNcAq9U
	3FeDfv1+Hj6yKEZzu93XqIphpzRLU+ZBFIbPc/oFBV7xC6VmUetjyaSwPnCb7YEh4ex+wEWqN5f
	T/1sFv+obD/uIY/jlU0mlKYE7HZN3yN8xdC/0mZsiwQJ9bsJXzlcuBlKXZvqF0hL5SG62GPUVEv
	kQU4TdTXGGu04WAhFqCn07LlDsEiDkgquGhhYZ3bYbBTj9Kyx0WH1fqekcWE9YCECgCWw1bkDMb
	3mb+qaLyzJuEUdRSb/U9PJ9jXdF4XnkYYvJmZ4D6S2ZmTpm0s1VtWplXs6S23p0YmoYCM7lY0Uu
	5cI5jHrOhmCL1Op13TCyJQL8BlA==
X-Received: by 2002:a17:902:ebc6:b0:2dd:c053:9c6e with SMTP id d9443c01a7336-2ddc0539da7mr117471885ad.36.1790026643047;
        Mon, 21 Sep 2026 14:37:23 -0700 (PDT)
X-Received: by 2002:a17:902:ebc6:b0:2dd:c053:9c6e with SMTP id d9443c01a7336-2ddc0539da7mr117471595ad.36.1790026642576;
        Mon, 21 Sep 2026 14:37:22 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec0d55esm650212eec.20.2026.09.21.14.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:37:22 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:37:18 -0700
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
Subject: Re: [PATCH v18 2/7] firmware: arm_rmm: Check for RMI support at
 init
Message-ID: <20260921143718.00001e55@oss.qualcomm.com>
In-Reply-To: <f0a4672d-c7f2-42d4-9fc7-b5a1d0ad3b83@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-3-suzuki.poulose@arm.com>
	<178978126541.2352296.3637463397103730192.b4-review@b4>
	<f0a4672d-c7f2-42d4-9fc7-b5a1d0ad3b83@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Ueja1juOP2RyVxfgi62yEBA5XUK5y97
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab1a393 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=dENJxcbTWoohif9XLWkA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxNSBTYWx0ZWRfX6pNFWQC7Y2eu
 4mpfEqGlOlCDap6hEJHLV9YUK0fUUiji/oRmNQlJH8jrR2NRT4c+tZa+CgErkmB3WNOZg21jW+H
 Omjo9NOHo0BKz14GYJxzYRbPFEQ3Pdk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxNSBTYWx0ZWRfX9H6W/FUKmnfq
 7OqUBXQgTssmVTQ6AL4sRliss/Kj+4w8eteT04G01oxJuOBiHupG1wvVE8ugH6DLOSJQCg/h9+D
 aRl8r4zOb8dkv/hOwOPm3yc/5JZrwjz9VweBfKoF0/oOli0CKVSjX/thgsd6UHdMEhKUB/T8z/B
 u03k3xOzaw+TnVX70rZOJ1hDzHHqH8uq5Kk5TYIDq9sDjJZSe0FWOtestvi8W9w02PrdTj3WRpj
 ycPmzRVRPsfI29oqNOylPU2F+qoEXhE1zRc3ar28uDHwudhNV9zRsigUCM150BjIcRWmlDmPIY5
 57fkdhnq6WMx6GIkKbynGED9TBTxEiEwJBXfUNsAU2TbBxxdHKQ6drVUdKStUBZMa9rnyNYFEmH
 hExB4EVUA6i4Di18R3xWNnAr7Rv1wZKsSP1qzG0dKiYp9rN9T1Tw0remkSIE2tAMqIk4FGOKyW+
 s7E8E2pP9bALQc1AEpQ==
X-Proofpoint-ORIG-GUID: 5Ueja1juOP2RyVxfgi62yEBA5XUK5y97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_143724_557681_A01790DC 
X-CRM114-Status: GOOD (  24.48  )
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

On Mon, 21 Sep 2026 10:00:20 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 19/09/2026 02:27, Jonathan Cameron wrote:
> >> Query the RMI version number and check if it is a compatible version.
> >> The first two feature registers are read and exposed for future code to
> >> use.
> >>
> >> We only support this for Little Endian kernels, the Big Endian kernel
> >> support is anyway marked BROKEN and is being removed.  
> > 
> > Can we have a small comment here on why the default is y
> > 
> > It's a big thing to opt into by default.  Feels like defconfig
> > material maybe but not in the Kconfig defaults unless I'm missing
> > something.  
> 
> We need this for KVM arm64. I could drop the default here and
> KVM selects this anyways. But, how far do we go on this ?
> Do we need to be able to disable this completely even for KVM ?

Not sure. Question for the KVM folk to decide.  Lot of pre CCA systems
out there and domains in which CCA may not be useful,
so definitely makes sense that people will build kernels
without it.  

I think dropping this default though makes sense if KVM
can select it. 

Jonathan

> 
> As such it is a relatively smaller blob:
> 
> $ size drivers/firmware/arm_rmm/rmi.o
>     text    data     bss     dec     hex filename
>     7477     572       1    8050    1f72 drivers/firmware/arm_rmm/rmi.o
> 
> Cheers
> Suzuki
> 

