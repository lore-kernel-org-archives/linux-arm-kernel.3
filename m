Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40651C98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=; b=dzIs/Z8qGCENPKgDtPfvUjbI9e
	IlAg0GQMBhdxrb4fEQox9Gn3zNcuXf/KLXNvcUbPAlJ5Onko6z+FHkIpCWOAI5mXN36iOXjLG39CA
	wp6b2CFo6+XWXOTz8Cla5//TO+GBl+RomxLZpNBlZQ110c01ENjNQuFtZ0IBSWkk/ybPMR8elvqbO
	ejAK8udW/FU0FaYgRN5aG7GjCidEuXijW6/gDk0YJNBbJYd2lAx274B4k6yEG73R5/CFXcxng2WO+
	YsM7mFmanvSaJY3SS4NfKr8LEHU2Z48WuP3m25UeXOxS2sQQGYRmO5ULw0uZLk+Lwj2dtObgGlrnI
	1DGDIeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9I7H-00000007UNx-2OgZ;
	Wed, 23 Sep 2026 08:14:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9I7G-00000007UN5-08Lg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 08:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=; b=eubqV63QU2rmRoWdfXi5YJ+MMU
	s4yzoka8i/y1zZbfaJFXZrGh1HIOXNCU23EFjtA36Dgi/sazSIhC2e2Unqt6c+93Afw6ZY+BznqCp
	RsnpLHl9DljLqE64LRIdKRONyv36fqHEFrX39JwovPXA543uw9vNYm3JQSW+aY8mM/rkYEvCe8OgH
	IsRVEw1VoSAO8swdgSdwRLeUmbjL4Y5bmpB3xYAOz3fI/CnaLyK6KlvJlNsQ/Z4rsJAOgmQ8rFqMi
	ZPV3DGzd+i0b7Bl5gYDXMQUSK/mEkKIOSIGB4kdkOnDFnttHE8RUv0+sIrffg+3VXipwsy4GsUGj+
	H90Isbpw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9I78-0000000EVoB-0r6C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:14:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79jiS1232014
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=; b=Pc5nEqxjyffDYNoL
	tCcYpKJMosbu75RawY+Dy8ZYulqkAZflg/y6Oy7BWAHRGabEX3UExzWlyyrDKS2v
	+U0kLdTnitIgjKeznvUsuP45A7vKa+gXh21xgveKaswqj0dkQFHDKYQxcxCJ+AOO
	jRmgaF7CV9A/K5FmndAcZGU0gsocGLj5XdsnogVlLSN3XQXa7c24JaL1osIvNdiW
	MEwyDIhbhRJe2uZcNmOYVgcwA+X/26gesM5C9X6yPwywAm1cbXYvaLsQRbSgTIxx
	AesRnxzogbCvjmiVjbD7AdKR1ICPfjTBJGSkBbE5LoZ0ilWlP7IFM7PL92/0Gx5r
	db0C1w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma2te2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:13:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cddf4f59eso14339846d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151239; x=1790756039; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=;
        b=FshsZwbDY4Pkth7q1RepqZHBgar5sBWqo7bDJrYWqV5sbDr9JjuXUQ79+ecGtTJx9B
         PTtkPaKGTod0Z4exzW/T3SzUyj3iFR3eyinIloSItbytoVBTtk4URvokh2g75UeQmPe4
         SKeMHjEClm9f+rVJZjy7Ma4+jP+V/f2nfGPf/n7bThf1AHwADB5jtkRucP290mNuYM6v
         yBhhYuLX0glYncDbiym4rvp6yENxifpQNeqnLsGrYSmo1DnJcWldyskdJJ3kC8gdBhLQ
         MAsWFVRaUM7XEKnQalQvUfqHnsdtrfB9K1ZVXxasKxiEecsM2kLD2KdbpCtw7xSiwmA4
         ZpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151239; x=1790756039;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=;
        b=T6R6tBoq2Ip1YXKvAVh18uk/gUX8orKOPSAQW9phcZdM2oxPGZKrpdtjT3KT+wb1Bm
         48dqb+LnhEq3y3eRrK0i+eJ9jyQULwMDnbSgeOgJEZK+9ZSH2rGgzR45noDAZn86iwnV
         SFA2jXEsTXx9soaxy2B09DBEZDUVkCRf+LX+U3oQk0oew6BjGeLjQ3+a9hfbH3StVShv
         DOFYcJtLmt/O4JtIbRmllE4lZRyDcSd8/mmUsMi8vioLYYT1TMhCxgHNWe/D5207V+/9
         G/i+cOxkiQyk/+MgFOQBXKMIR9GBH3O0X+44rts2jORdoEWvmfptYN84V9UDuM60GNPP
         D/bA==
X-Forwarded-Encrypted: i=1; AKwUvBw9Vu10i8QUsZWn6QAslGUf70Op2QyfvCW5HUSn4E076g1NsFmjMu7hOBOiTjOMd/AfBpEX8QGPQ1dXGxaxRIOW@lists.infradead.org
X-Gm-Message-State: AFuF++lcXeVIkQdWOfLEkEQO9I32lkupGwfqNlgBbqVzko3aBhQV71Nh
	I52kccq8rQ9Rg1PNvtlWD7x5zzi42qpdL5ACKAdvRPhaOVkS6Wvl00xDQ9MFHUThTKQRef1/uEc
	djlxOCBWDhp1MDHeh7SuU3IQiibyQc0uu1ouKIQ4P5LIsRRKse9DFXYVz71kBweFLZAMBX1BdgS
	XCBA==
X-Gm-Gg: AYBFou32YR+ohTMfq5lXTF9dNVBHcNBBj2GAVXfWIksvgZaMY4HsweHE+rCx2D0U6fY
	IkoQblbb49gLLQBl6Az/8OUMmGQPCeO3ICAr//GItAPGWYqy2V6mCZgNtuUm9rg09atAuCz/rex
	yh5aBy1/EHZ1XTM5s9saT8a17yjrfod/igOCqtACA+VKn6zJc2DjQ4e7Q2ijW47I9PROZod1nR1
	xid23GLWeditPanTG5GmSTrPGPSeljkIc2cJj44iuALjQiJTi1l/3tKAakVZM0dPzSTypRV4DRf
	FWnyBjDViG0tzbf3Bp+PatmnhqNWx21uMyoYPyUcjJGrI3CSDmZ74sQZiXXE4pK46fJm332yJ3i
	/MDw9cuDJuL7Ffl5RrSDbtk34Yq4=
X-Received: by 2002:a05:620a:701b:b0:93a:83d:1d0e with SMTP id af79cd13be357-93c251fc9cbmr279979985a.38.1790151238616;
        Wed, 23 Sep 2026 01:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:701b:b0:93a:83d:1d0e with SMTP id af79cd13be357-93c251fc9cbmr279977485a.38.1790151238276;
        Wed, 23 Sep 2026 01:13:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf9691e2sm50454405e9.1.2026.09.23.01.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:13:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ridham Khurana <khurana.ridham222@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
        Brigham Campbell <me@brighamcampbell.com>,
        linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: zynq: fix runtime PM leak on request error path
Date: Wed, 23 Sep 2026 10:13:54 +0200
Message-ID: <179015123239.7939.12868400217735279583.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
References: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Uzoi1rQZIlDWdjqrOww2kLZIZjBSUd4r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX3/lOKHILjnkz
 rVKIKVU9SkWHDt3yhdN5cS8wLtxM4Vmf5qDdae32kSsLDHxvakbPQRII51svd5DSBPAsiA8Y0dC
 Qj9jHP853tjsyzQpN8hjipX1XoE8aPk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX8TTX6kme5suo
 3bSm0olLsNHjRW9mRyL/EZHg9h2dB0W1/SDToNlYbUtZ7qNYKfC6rsfgXudVBVSwVw3AphmV2GE
 FKcnjUcHFBUUYvCZFfRRSmKX/sHEYKQ7um6ZgrQl6Vu8G+lqhSBmnBU942niuhGQaBluL8kMfo/
 PDTCf90dUq4N/jwHW7rKXUIzlDgeh4aSzBkrnCF8qmoJbqI7FxLQqF1HqJHreJA3obw0TbA3ABT
 JE51uwvn8ipLsFksl8sK7nGqM+qVAgvE/J8yNoGgQTe73M9fXZnVc0hIkkz/Pwgfw2QjKZ0BKHc
 0Gm0gfGwn/EZbtfIPMvHRpm8PjWcjoY3Due9v0zoCWRyZnz5OWO8v6qao57OKfOV7GSTgjxbW1z
 j+3IPjBFTlT0Y9sHHAOIBNAF1QcQ97RXqOnlhgOgOF1/eN5OquvzupakzpInELNjhsest/9IAgB
 aJSMBgO84+iWVjfnapQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab38a47 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZA4Iygp0GN2kJPZu5X8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Uzoi1rQZIlDWdjqrOww2kLZIZjBSUd4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_091405_218836_3AB97370 
X-CRM114-Status: GOOD (  12.23  )
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


On Tue, 22 Sep 2026 09:20:58 +0000, Ridham Khurana wrote:
> pm_runtime_get_sync() leaves the usage counter incremented even when it
> fails, and zynq_gpio_request() returns the error without dropping it.
> 
> gpiolib does not call ->free() when ->request() fails, so zynq_gpio_free(),
> which holds the only matching pm_runtime_put(), never runs. The reference
> is leaked and the controller can no longer runtime-suspend, so its clock
> stays enabled.
> 
> [...]

Applied, thanks!

[1/1] gpio: zynq: fix runtime PM leak on request error path
      https://git.kernel.org/brgl/c/e9438ab5328a177c9c0e5df87eb92a7162841e98

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

