Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38578CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 00:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmQr/nvqXK+zOFXNOeHfnc6GNLUHSfAv8AGMrlOSOR4=; b=3EdRlsHOjTQDagVHSBg0Yvtd9s
	z/Nzb0tKMP9TYTIDYzXOuEwEFXPoMN7MdhkDvNvt4CfpkWWnJ+hFZvF6hYarjjxsvbxC613xN2Yn3
	I0I9+CScAKWohu5z7cuONbCH3XjlVS4HUiXYEHIv2+F98Q8HUsVOiz7wG3zknenV3NJwZxFfE6vqm
	KIq7JBEwPi4pSBLlpdaxDUyWBNeimknV0XR6mvQk6BBib18a4subZkSs/apqLQctTk0Nu2ch6xk7Z
	Q+ScLf28EPs86IRATf2lZbshA1UiBy1MLMu5uFWN4WnZaRYsOwR9qxEC6Ki3rkOtMDL6OmpmHkvr0
	WuAkFrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEG9W-00000003GpQ-08ML;
	Thu, 30 Oct 2025 00:04:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEG9S-00000003Gp1-3OBn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 00:04:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TGF4IF4155397
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 00:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LmQr/nvqXK+zOFXNOeHfnc6G
	NLUHSfAv8AGMrlOSOR4=; b=AZzOjslyn+AP6WLjvmjMX420G6Qvsy/DISlzjLw0
	KWQZA6TKF17Aacb5Yu0QWeHZNnFlDO8+ALvD935093QNgc5fHMGJIQa9rIL42NHA
	Z29JVa2n1aMfQ4W13LLfkdbMt/y1dvpw6dwF1YBoZ/rWD/p1GmOCQwp1HfQ5Y742
	Kbq8EDDEu3XZdPe6vCMQnMU+MEGf+/LRKcx69w9xQr1gpOsKFSoE0JWwS3dgc7ny
	XoiSMn7IWGZ1WKYmmn/RwNEmKx1veRy2eQj8Z0Hpojunh8GOOK3sZ68VXFt260Yr
	EC1bQWqL2WDAVvEfplslbFtQO/q/q7rldwf8ND5+ww72HA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3fy0tpnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 00:04:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ecf72a45f5so11678481cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 17:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761782664; x=1762387464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LmQr/nvqXK+zOFXNOeHfnc6GNLUHSfAv8AGMrlOSOR4=;
        b=Ipe41/aVHQ7tyO6BkcevtHUT9Or8UgaYhopIxy5XN4ndx7dzULSem6iCMnoV4PNpIq
         qFfrewK4m9moXny7FsIU2tGTfBAIndxcwcAZDnvlrfLK2khX4K2SPhInqWGZ7fJ7jf11
         l2ZXzgEslF49drp8ZR2iaoTyrJiG+Iop3LCglDAhMw3w3rL+gFD6CI1arI1qMln7mG+q
         BfBE9uxihdfxhRbxkzFgQLvq0tNDr3WbZVoVYUDX7Boc2X4pkVwzdikSe2CNPW38KEJM
         d49TBKeNxQsMzKktV68Df0kCiHTB7zPpeD3/jgiU7djxbZrQ49EvXR939HYxgRsInPkC
         BGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761782664; x=1762387464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmQr/nvqXK+zOFXNOeHfnc6GNLUHSfAv8AGMrlOSOR4=;
        b=s0j+pimJ7+7KLdvlHh6QeIIfv/es2wLM+2nLtqUhHxLifGj/1gXw6EQCTh/jYbdTms
         Peu9IDRdgAMl3dB3UiArxoXoLHGC1Ho9TJuGUBQ+Iz09uOzF9zhXgeG/dj5pOtMt8ldy
         EMRVdHqHuBSV7wD9bi+ECbheE0ivaBil6csuL38AcJxeYgCLaWDMAPNmkOe23dDRp1GX
         c+iuHWqr7o3pHaefinMR4qENqk+Ud9P3FaxmwgTh/+gQ0/3TkrFynKc7Y40gg2px+aP/
         xLVmrpc1u4kksgx/2bA+pRuqSfDHCG80/dKBK6HfDlE7g/F0aNFmCXX6FIiNV1QJFyev
         3Q4w==
X-Forwarded-Encrypted: i=1; AJvYcCW9JVLYb6kKRKpZIJLsDDcp4j5EwBkiJMui4egC30SeHw/zLmx5BBvk+mX7wf9kYTRKUmar/uEUMJoxl1TIVFaa@lists.infradead.org
X-Gm-Message-State: AOJu0YyMOIrdkl0/H+CVfflubuAOJ1uF4XnYecaj1E2K0M6inO+Ckavi
	K2+7msyg+J8nVUKugOgGpkgMCO9m256JAcN4ZYKTbjxsHRDo2cMIkAmLYk3PtKzwcj6NTD8vAgE
	z05ygizfeuW77UNW7XeNdwupnbnsYFsjMs8afmyZUz/mhGRxBRQYi0FsLBWsHCdcTzH9cWXp7Hx
	FNcQ==
X-Gm-Gg: ASbGnctKDT5/7S0k+dNc42xJv4rnns4JsYejBYQXnNJVoHljk6cCf9aHd+ZJIgRyedt
	PHRK8fwyndpjF4AuLi75HjkMAbv+h++bSuO8QHBoFMH02DelQ+decJSiHSctBe44rlKkwlkeU7e
	UQDA8Q71/wgTPpyculCNOXnavTA8NtNU9Lm/qODHaffnD75UokAJFvzUlEP64uBhhgybJT2O0ND
	bavz4FedEc1krhvhl/Pu3j1gtee4gS2RHiuYupm0rlNo7V4LQaiwHP/gIT2fnGNE7YCZBZ9Oac9
	soFC9ndcjnFsGbNHRfHZXsPIdbKbTNakXqcdwTDHqnBpqhib1XFW0hXEdyQuEXIvkvO3cCiIb3M
	7uUbPTsI4dTgJLZKzigTCKQ2/BYKWvh/w9hczhYX9eZOINv0REMNw6iVoI1/x8KS/SbSlvAwmta
	osX7sx1PiTocJ1
X-Received: by 2002:ac8:59d4:0:b0:4e8:9704:7c83 with SMTP id d75a77b69052e-4ed15b53e60mr59019541cf.14.1761782664173;
        Wed, 29 Oct 2025 17:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHls9al2XoteQcyohoS5y0Zyle0J/v2kM9a5LZVzgtA4jNe9zTqJ/FMEHsgEyEmUumiISYvUQ==
X-Received: by 2002:ac8:59d4:0:b0:4e8:9704:7c83 with SMTP id d75a77b69052e-4ed15b53e60mr59018991cf.14.1761782663698;
        Wed, 29 Oct 2025 17:04:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f7444bsm4248514e87.85.2025.10.29.17.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 17:04:21 -0700 (PDT)
Date: Thu, 30 Oct 2025 02:04:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
Message-ID: <jjbiamlcof6gttme3crotwyzsxtrguohaib73gcsaabpan5fqe@s5uroqqargti>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
 <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VJLQXtPX c=1 sm=1 tr=0 ts=6902ab88 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EhQ9wbuxbXqUBhoRm5MA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: yH0CUppdTMQS7S2YYDTO0Zo4zcsDbMUe
X-Proofpoint-ORIG-GUID: yH0CUppdTMQS7S2YYDTO0Zo4zcsDbMUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE5NCBTYWx0ZWRfXzweXAJGbHNbP
 y7VUIrGId8dfyluxrODpl367TBE90wS3c3B65EeTdyZGXJoXVJ6RvfIAWzVfjlAtddHWDlj2csu
 4fjsIL8n/kdiGZ1P2in+QCrcTfWunejf24cjObWOT7i+bnm+3i47gNq8bD2WSzZTpYeodGSrmOk
 olKH59LykKjvpWuZK7qIZk0f/JC8CeZMTXHGYlUtXVGjwS+x2z6TVPr62/NjbIyQ58uMY4GXvLG
 inan+EZKlKBbXG+z5i0Y6ruWhnk0ieYL07ldy7nuP76A8EAHHK7jXfA0RrWxJPwg0xH0x7Ag2Ij
 8yoMNUXn5YuAReRL6PmeDOaNwynyG9apsQpR0alxOf8vk3TclFUss2OA3JA4awBEqht3CtKc8Rj
 Hb0RmH/vGKWN9KTvhzX3nLc5+i2BbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_170427_000895_C183059F 
X-CRM114-Status: GOOD (  16.17  )
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

On Wed, Oct 29, 2025 at 05:00:00PM +0530, Krishna Chaitanya Chundru wrote:
> Enable TC9563 PCIe switch pwrctl driver by default. This is needed
> to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
> Without this the switch will not powered up and we can't use the
> endpoints connected to the switch.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

There is some broken logic in your commit order. How comes defconfig
changes come before the driver which actually defines that Kconfig
entry?

Please reorder your patches _logically_:
- DT bindings
- driver changes
- DTS changes
- defconfig changes

-- 
With best wishes
Dmitry

