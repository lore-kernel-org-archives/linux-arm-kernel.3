Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C050CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avNchYSSQ5C76WL9TdivX7otlmLMTH9erYuzeGDpuJU=; b=QAXpDJzV7GhY1Ew/qGzWgLmm4I
	phw8Hx0hPMGs09kp3Le7zU4TeHaXi3uzdQjZrbDdZC7zuDOV9DlTW6IgVubCLKPkP7wb+ODII+h1E
	jpe+HxkSZxRORHor4er8+Z2+hE1cPxeyGKMy4bGZb7K5otYinz+wA78DFtCAOWHl6hp0+V1Af+m5L
	g/++FagCEq9HyCAqmo+vwDZK0UpPTzsIYHpGlgFk6U0ATC9TlBVlDcdrexzFV5uO7hO8PqAfJWI+R
	fx3dUZuTiaJkWE9rO4Ww+vwtVhiZJycupuToEge9eu+oVuKOkEbvuMMjdXqN4PgS+0mWiFYpudLE7
	h1Sx2BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8T5-0000000GQ0r-3HOL;
	Tue, 21 Oct 2025 09:15:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8T3-0000000GQ0I-0a5r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:15:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8IWIb028420
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 09:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avNchYSSQ5C76WL9TdivX7otlmLMTH9erYuzeGDpuJU=; b=Ra0gkOzwzkGEMmWV
	HAWz1/Ail+Ta+Lr+rcEAfTpNe+UnkKBkMZXcEylYUnF8I1p1KdTs6WF4Ha6y/SG3
	PwO+idtwtAdS9qOmJ0ntW3glzURxBEXMWLkrHru+AehWVmBm1RisrExV4WqzpRq+
	9y43pkSbbDY54w3B+pJexaUnJ9Q3ECl/IXhvbf7uZbJuU7lynFJSk97ImiwAiDeQ
	jVJ/lPcgxVZsbUsg6rRqJ5QhTogcoZsigRda/Qrj8/mH/m4mwPZJ+9DU/Xfl0t8n
	4kIBSjBbaT1R675+wgJzYYP9Eph9Dgpxe1iTGi9AcqUGRlniEIGzOV4/REiYFXA7
	K+w5RQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pgc49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 09:15:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5516e33800so7974009a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038143; x=1761642943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=avNchYSSQ5C76WL9TdivX7otlmLMTH9erYuzeGDpuJU=;
        b=Hk2Wh+5nK6xDixWxW3RzbLD5pbWzdTbT9bYEU2xgfLby3+gQC9VoHdY0+vT+V2aCJi
         skyDgSJpkbudNG8zWWYZpK1fJTv1rTlp3aWH0weAdbBqS68jry9mFDNFGS7bq/72dVXr
         TwW3Y4bXNF57AQw/wMY2zCeQMpGb8kldR0Kxa/vEmTy8U4otXMLc9b1fRT5VEyt5wr2N
         WvnPOU2NGeRKJ4oByVPvGda/d/M3fbAhxHX7WwDaA+5IC9Uv6o81Zsnf40ZlUruLiv3s
         qwq4gP2Vh46Dj29MRKuchuRds8WojbqqPH0tU2bYaWF9XBcKXsjnpxVuMLKwt+ERM+W0
         TVSA==
X-Forwarded-Encrypted: i=1; AJvYcCXA+oDOoCelawP9CHZjlJpBWb4ogB205+nVN9eG88WS9OEUKiphUPs2Dac6Z9Wv8q25PHtCyLMgh3fYdYYbms6v@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Q3jU2xT68zM/5eIfofTfVS1fscHWpdmOJTpYfwp1A30uKnc/
	G64IZvGEo48Qmjq8gxU7DEZYUDbLErlbSXjpn40U4iagXdcqBgwKhJf+lsVdSt3QmaGRvyUrOHy
	cd5NKsxm7pPbQKN2S7MvZ/L2ew6JWr5evH2Vp6OKrg6SFHwEtc8Re75noY50ZWrNGxCnGxdhASi
	XxLQ==
X-Gm-Gg: ASbGncsebTbcZfr0ZkiEG9V1mgBGoajpP/pgsMHAMWEVDZe5UsVhvqrRZti3SsTCVRX
	FpQw0JofQo3WyJlLhu7T3jyaVXeV94ZbRHzgjBg87vl1GZmTG7k9xQnfg78wgdyAlc/UmRob7iC
	ufNxqGS+y5J7RuiQn1BEIJcplGfK/E1rGqxRb9u/Keiur9IYk8860n47/mdJLuZcvJ1y/hc1rLh
	xoBK4w4Ib2dVqGMrb0iH6xyThy/sW+0DQT4mwOBD/a4WcuzsYxhyRQtW7kuz0amZNo+HNHzO7Zu
	zr5IuAV9GCPUlFcdEra5MTUJw+D8LepUy04PjNbDWXO0dlKo09/gkaoNuw8uLesPTaU+54ErVa7
	UUa7Q42DgAU/6VuVJPbG/W3X6DOk=
X-Received: by 2002:a17:902:f54b:b0:290:55d5:41dd with SMTP id d9443c01a7336-290c9c89dafmr224968445ad.5.1761038142878;
        Tue, 21 Oct 2025 02:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl0wvQqiifAOiiVECG0+AnufRO4O9f7wGK/yit+8fGE8HpLP64lRTzQy6MtrZfs5AVKXRoVQ==
X-Received: by 2002:a17:902:f54b:b0:290:55d5:41dd with SMTP id d9443c01a7336-290c9c89dafmr224968105ad.5.1761038142409;
        Tue, 21 Oct 2025 02:15:42 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd8edfsm103090695ad.44.2025.10.21.02.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:15:42 -0700 (PDT)
Message-ID: <2eb77c1a-85ce-42e8-b77a-82b8e175d943@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:45:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <s2u4wktoi26b5yjfl52j4y53r2bgtwsryacjd22smidl4kbtsj@ahiqbwgrcpif>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <s2u4wktoi26b5yjfl52j4y53r2bgtwsryacjd22smidl4kbtsj@ahiqbwgrcpif>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX4jA6dcdPFoEp
 1Fj9Ft+CIsF//tObbEp64s0MU+Kv0pSunfe//zGY9Fmtq6DmwW5U8f4moXfohAkK5Sd3f1Et4Oy
 cu++tzUsXRunb+HT66QVZkfzEWzRcXPCFlONKseEMfvluKkcJJUr9+SVCcTCKoTvbEM7DQL8cIe
 7U3V6PigTaWGLtkwhKwUW+uCiNZQtuu1Tb+awP6n0WeSbT1v1+bZHqRTFrVruKmdORbDS/NM/AV
 ZXQO8WX7lDCWL1npCLiPYN64DrV2nuNoiLHyo+vfjpHg6mDggLvkXr7+5GJUbfKQ+Aq10znPw/z
 BvYiN6w6Jy6tQLWtQvFcH1TbVUkHMo/qEmWVouycWb60qNxlMuB1oQtP1vZ+QXyDQiUk1ErbGoN
 6REI5nqLdkSVW5b4HpHvfaUYzRDybQ==
X-Proofpoint-GUID: QuPN0zDKnsMtuzSv406EcDNHDmYrGHzQ
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f74f40 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HPpIKNdv2fbYmD8Kn4IA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: QuPN0zDKnsMtuzSv406EcDNHDmYrGHzQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_021545_323432_6037CE83 
X-CRM114-Status: GOOD (  23.36  )
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



On 10/19/2025 5:27 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 17, 2025 at 10:46:43AM +0530, Taniya Das wrote:
>>
>>
>> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
>>> On 16/10/2025 20:53, Taniya Das wrote:
>>>> The TCSR clock controller is required  during boot to provide the ref
>>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
>>>> the UFS driver successfully probe and initialize the device.
>>>>
>>>> Without this change, the UFS subsystem fails to mount as a usable file
>>>> system during boot.
>>>
>>>
>>> That's not what I observed. UFS works fine, especially that it is a
>>> module, so no, this is not a desired change and explanation is not only
>>> insufficient but actually incorrect.
>>>
>>
>> Krzysztof, on Pakala MTP we are observing the below issue and it
>> requires the module of tscrcc to be loaded explicitly. This patch also
>> aligns to how it is on all other targets.
>>
>> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
>> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vdd-hba-supply regulator, assuming enabled
>> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vccq2-supply regulator, assuming enabled
>> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
>> unknown)
>> [   10.573078] platform 1d84000.ufs: deferred probe pending:
>> ufshcd-qcom: ufshcd_pltfrm_init() failed
> 
> This will also require you to set CONFIG_SCSI_UFS_QCOM=y (=m in
> defconfig), CONFIG_PHY_QCOM_QMP_UFS=y (also =m in defconfig), etc. So, I
> doubt that you are using defconfig as is. Please extend your
> configuration in order to pick this module.
> 
> Note, defconfig is supposed to be used by multiple platforms and
> multiple defice. As sych we can't enable all bootable devices. It is
> expected that the users either change their configuration or use
> initramfs. Only "working console" is expected to be working with the
> defconfig and that's only because systemd doesn't reopen /dev/console
> after probing modules. If it were, we could have moved all pinctrl,
> interconnect and other similar drivers to =m in order to make the
> footprint smaller for other platforms.
> 

I agree not all configs should be made y, but expected the required
configurations should be made available. I will share this feedback to
the team and also ensure this expectation is taken care.

-- 
Thanks,
Taniya Das


