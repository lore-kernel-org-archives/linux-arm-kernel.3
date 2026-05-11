Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05A2CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLY2VCjl8g6bhxiEibkpJCM0BlQlq6ryQ2kEFOn+kbg=; b=kxQPAmJlfdjMBDVN37yCXUBuwI
	+Ds5VunNNPrvA+s6zC0POaxMT20xnqvgTeFPUeJH4nfURn4gxUZK473hf2Ep5GOGspbL9qNFkkbec
	eIYnQxNFpEaqUINNindTceCUsoTtrqxaGnkPmp2kXZE4Ojba8kK4UMuT6AxSmZJLbiq8eSGMKQW4q
	VtejvVBCtyDqAHgv9bsHLQCSGrsBTZRMBI0WzYdvhkGWFyQOoYOWcauPTgVj+4ipXobqfyx7dtj7y
	wzbsZgqbVQcYYpLNACK5oB4aNSMkpAns59URDpwLV3HMlAiG2e165xr577Tcsw9mTtlsRxms5w4cA
	TdH9bsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLS2-0000000CfN3-4BzX;
	Mon, 11 May 2026 07:53:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLRz-0000000CfL7-0Fcm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 07:53:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FJrL3332677
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLY2VCjl8g6bhxiEibkpJCM0BlQlq6ryQ2kEFOn+kbg=; b=JifEBrIzkipipDVM
	vOdwPd+19TTH/aPFCB/TmNf3idgFu/+QlJTBbS7agfLKl5VAFBheqKW41VxLxANM
	ALKs2jsDK32H8AKLEvNpWIwKw3UdopATmlVasOb44fqiVdFTmH2rpCPuxjD899FA
	zBWbSkeuO1plmSxi9hMWUzGAscpudUZpkloXMf9PcbxGH821H85Br3rpF3VGDZ8I
	J+p4MQFsd8rK1H9y2eJLERcDV2rbfCe3fAvJ4SdLsLEd6DoTKqDRDhbuChQWkg2z
	qsF8VP/+2p9hu3D/x3M9ZpJmr7Z/ZMMdCkqvXqDj/E1fjEhOY9c2Nk6SH9aamQBw
	OTMTOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgr4q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:53:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so98187711cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778485992; x=1779090792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLY2VCjl8g6bhxiEibkpJCM0BlQlq6ryQ2kEFOn+kbg=;
        b=cXYpOyzAVJ39RU/3PBZPlL7ALDLXNKMhNxuBhga3kZNKQHfIHX/V5mDujbiuGquPzI
         vUhz51DKyHsNmYqorSJ3B6eDPKiP3pyBp7/9ZbAe+ofzEV+0L+2we5ps+b5OzdZ/KWYq
         woiCmW+AlPn/Un28K5UAZR0seblUiKlAGiEpLQ9h2xggwhz0E7yUtyGf9WNDuWzFrm8T
         9lTn0h4TQNfTSjCD9Q7C9SpveXFcNU2ggxxO4Dyy5ECqywAneu8e5OYyl337xTzLWQjJ
         rkEdoasbN7HCaLzSmcIDXFHLENukmUPkJeVxUZ/H/9beTwkoy02D8X8t0+izX1cm6A5G
         IDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485992; x=1779090792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TLY2VCjl8g6bhxiEibkpJCM0BlQlq6ryQ2kEFOn+kbg=;
        b=fVydw4axcBtl7U9xZI/MQ223ZZlHFn2YflLO4aHR76IlNvOKzIeJXUlAhldP0f6TJD
         fQVZ3zM18YPRDcfRV12nriMIHfxiUKoztY4aHtLac1xWTCOKxcDODH9H5gd/JtcOCOfG
         luatkksdunSp0Fqpk6xBNpmarZ44FuKMDP+FYk82n1cFrszmpRQD1PY7xjdBocgsM33I
         bewjh6urke6w59mydu7jxf1ZoX7Hts1R3PQ/03PmfBs/UjnE2D1YO7Vnh7iIDn6lay5v
         BDfGCHSHs8fPiTRYNON3ZS1HuPTRq3P36azWXjVK9QBBhwFaDsFmrxWUuTHM+9GCipFg
         u8Mw==
X-Forwarded-Encrypted: i=1; AFNElJ+zymDA18jijGIuHF38WP47S6nf5SnkJ5PitL17kbVc8iBYK+0MYaM8P/udtKdo3alH67sVl5vN3XyeTD9H4be4@lists.infradead.org
X-Gm-Message-State: AOJu0YzPc6X9LJurIcd2usL6ICjifWHknPn+DY6AhQPTyjWO25SWHJUz
	3GgOvEAHcCpuBnCsanobLuu9teqZE6Rt3yc79qGWIkIQUNCCyiObmobKCupk1VsQIBQES9ZkZ0u
	ViGWe6aY5SgwRUSvqtgmJ+GSojquY6J7u7qo03y791uNaT4cPwNAh6Y9trOoOOeQ4oxmJg/hbIH
	wmRA==
X-Gm-Gg: Acq92OHCJmCiYyyG888kPWxDFoDju7QS3AQy3gOdb4n1AL3GN+PjnmlfnfLHoJ77EqL
	L4SMG9OlicxEgKwVdg4P5iTSrYQuJXr4O0J36Rd638tjKtRQDt0o7r7XWtZLSfELC5VFOtKxZMF
	olHjRCc9HyQITik5vLpp0cYYdWdUzohusbd0J1ajKuR5rVsEITPZDOiHQe9FBp4XUAaB42rdGNS
	RdUe8hiHwVdZAXjUyYaSxlBXYkkP9J+TxBVzUjwXHWgUeqcfFN22EMc92W0INmQUEQl9wBiMV6v
	ECSmdTN6E5AVMbgL7pPAx+DsH+5U7XR4y1dYYmvAazjs/CdJ8yw5JUSyCFO3ORO4irAJEE4U5m6
	A9Skhq4f54BslnMeoUDBJgcSzu3NK0pFLO/OSUJvdRSTeQt0o0w==
X-Received: by 2002:a05:622a:24e:b0:50e:a1ab:67e4 with SMTP id d75a77b69052e-514a0b6daf5mr125359791cf.40.1778485992203;
        Mon, 11 May 2026 00:53:12 -0700 (PDT)
X-Received: by 2002:a05:622a:24e:b0:50e:a1ab:67e4 with SMTP id d75a77b69052e-514a0b6daf5mr125359541cf.40.1778485991680;
        Mon, 11 May 2026 00:53:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db01122sm78830735e9.6.2026.05.11.00.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:53:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: sequencing: print power sequencing device parent in debugfs
Date: Mon, 11 May 2026 09:53:08 +0200
Message-ID: <177848598595.10009.16977098777521143132.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507052943.3133349-1-wenst@chromium.org>
References: <20260507052943.3133349-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a018ae8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=v-dYCw11OgI39_w18cIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: UyaI0qdI1LxWep-iVFktGwFX_4GY-FvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4NSBTYWx0ZWRfX5ncecUIaX5Xl
 b82prAmniO+WOKDOV91TZFuvPWiK5c2q+D3yjHGAEg07NhkjqqL+7YjYagN/b9EPT2hIiDbrJ5L
 FFypBpHf5PL74JYqTX2/kzlbeHC5X7dwyxwfSi4fYjLwqVl0r8aAvqMG+xr8fI4TNKkrRUqe15P
 CAaQuO2w1t+iQwahrdyyui8J5HmpfQ0zi+BCfCpGZHvhHrWP2hfxj4bsmVZT3Td6Hki28hcpKlk
 ApH53ujQ6rXh2wDugMU/UV5gqED7KWKnnh1E3JLAnJl7w8Ow9KeXFd2kNYMbiehfiNGX1CPRy0Z
 P6/IEtHt5usSnI17gf34gDHLPXqTIWj5Q3APh02KWuGax6wZX9H9aHsQEYAVHbtQPvCootVagwm
 ePfyyoDmxGl/XMDIInndSnYr94BYrbvL/Hvb8XGW1xr1qstT9V9Ru8Vgs7bH11qY3s+ezt67klF
 FuS36e8yDvlMCHfCS6A==
X-Proofpoint-ORIG-GUID: UyaI0qdI1LxWep-iVFktGwFX_4GY-FvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_005315_221309_5E962412 
X-CRM114-Status: GOOD (  13.56  )
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


On Thu, 07 May 2026 13:29:41 +0800, Chen-Yu Tsai wrote:
> The debugfs summary currently shows the power sequencing device's name.
> This is not really helpful since the device name is always "pwrseq.N".
> 
> Also print the parent device's name. This would likely be the device
> node name from the device tree, something like "nvme-connector". This
> would make it much easier for the developer to associate the summary
> with a certain device.
> 
> [...]

Applied, thanks!

[1/1] power: sequencing: print power sequencing device parent in debugfs
      https://git.kernel.org/brgl/c/513f49c33e91e58975ada7967b44512179f0e703

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

