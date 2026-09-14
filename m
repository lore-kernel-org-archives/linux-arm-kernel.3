Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C84C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtkXZcX3eCc2fMQ+ziqCcCeRNzu7i+LM1BaMpHPINhM=; b=pXbI49x8kzrrSps0Wnv7YPhmJ0
	WJWl9Ho6IjtaM5+3fAlctMxFzn+480tHQKoCDDh9MluoX8ovi9bO3Wz63hPKRCTCODXZ04DgNpVt/
	Kj8fizkCBNTqdbSgEGlzrcJ4fYtkyVcgbBGu5LP8rWjpTuTmZNPyXriuHwFEkxP2E8KBis3oeK1ll
	xZzClvhEdygSyNaQdmIFi20L0qLnQ4pOcm1ITA/9znbNmYMCyjC3yfCddCmpIRLM533Jqi/Ok4TgM
	THr4Cc1pbGdDGDV/obcVuP8LpHcodg5pK0/zQD7XQrI19NSmdmLFlydnaeVZXshY5UJNjl57CyLQ+
	byrMf/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Od-00000002c0i-3XDd;
	Mon, 14 Sep 2026 07:46:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Ob-00000002c00-3DDc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:46:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5in8j4057533
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FtkXZcX3eCc2fMQ+ziqCcCeR
	Nzu7i+LM1BaMpHPINhM=; b=HkZTQ6Ko2WMUAGjXUdpjHw8socpUkrDnHVs0xogo
	6MY+t/IrFe4XbsEV0jLD9pu+XHII+jn4cMgC/9Zvda6awrPTU/+PYRfPt7CjF8ZJ
	2RmwJ0a6RD59cOZjRynA21GiCmmk+kpt/PGDBMZr6s7Yz0tvvu+xOTJ215yE41a8
	eD6zgTHhx5DLnXI+iQPBMI+un/nvJMfjDd8SJz8MwMOzwHLobQ7+d651EvKYrd5C
	N7HpJqoGK8vS1t6934paMx9spwtQXFA4SUVJLSLOKynxtEKjtGYV6acs3hdH5zUk
	0AGb7bN4JG8XjKrEqm7MohKxjhmBPKWX7gFWKf3dizNsHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssd9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:46:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so559927285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371991; x=1789976791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FtkXZcX3eCc2fMQ+ziqCcCeRNzu7i+LM1BaMpHPINhM=;
        b=Fm80w2uvdRaAOPcGUHbkAT9i++mgraVlAYKPYctDUZkfhsvQdwzXyYbSqOlRs8Qz+R
         Xm3kG/phdSuvl05NZamneaL02RRm4WmL40f35Ln1aTDQcPEVkvsh8AK07OW0ICwqMiXL
         jv2gu72JRXV/bNJbh1nKZc+BgZBgedgNXssUsATSYV5RuLT4lqmhRmx5yfcXea3XMaH4
         /ZkoTPWHsyvxuecnYGnewL2M2EdMhYMsbdRn1bTv1wsc92IR6Cc6ELkjNf8NmM/FMqbK
         zc+3oPkLYzRbfv4hePk8L10FfSlgqYGU1CKHQWTc/10b0cf18ArOdtnVgyHrcbtnH9li
         VLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371991; x=1789976791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FtkXZcX3eCc2fMQ+ziqCcCeRNzu7i+LM1BaMpHPINhM=;
        b=hxmJUmSWYDCdGJlIUv+tbGsCXL5aEtPTRHwUy4/QvTU87I43NGRHWOcg/B4GWJ6AXc
         mdMgWio/cstIoXiq2MO9+kQotOWkVmPj2Wgb6H1pVIbmqZuZmwh5tw/5i2JiwjjHCPKl
         FhlMlL6CtFdKixUb3kyQGWLQN0jSV4SMwbN6EUbJhnZ4pDCk5799MJUFOVsT98hE/61o
         sNA8gmnClmA9jjc0HKSsoCjFyOi5gYKs6PHMn8i8Pq0R/xatck2nBXZSdAJMNB7KBXB7
         bMu5CuBHCsswunuJZNMzcaW+rQ0pqFNYdPMVf5iqpmTfNAsuvVfnrm6nQQoAhT0HqSkL
         /KTg==
X-Forwarded-Encrypted: i=1; AKwUvBypFdbBYmJ/jtN4HBGUBvmC9wZqNT3KjJcF4Zbuz/6HtpsNSuoH9Ive9lHUthqDQ9aHAu1UqUiKBAtm4iyboyru@lists.infradead.org
X-Gm-Message-State: AFuF++lkhTVtJYWCUOUb1L592yYk0IINfoVw7WY1O7sv6QDx6zxdxuMZ
	TCAkCbLG+/DhaC0k2oYKl+SiDkroWJqUSV4/ST1eEz9emGSGZ9sXf9k/rzSsc5a6D66Htd5JQ1G
	oZhb7ATQHJoXc+8LfSFvYieC46QO1KXSkARi+tqTfQvKIOhVIY4UvSs2HoGJG2aTI0+OY/9Yc+K
	jG5w==
X-Gm-Gg: AYBFou3pRaG89iew0UhG3cSGiElAqH25TxUZM4zi+dj9tIu9fyURKargldnoYi//Tn/
	ncbxWb/1kbsnhwPO0kBIcRYDny2gWXsBvZUpDU/VaZ70LxOiUxroWYYnPtRKT0rNkRrGF2qwowY
	Rep9GCEYPBUrtK3zF3XEVGILiGVlVAwNu1PI6vG27JeQqjyeHf8nwn75prxWh2hLdX6Qwg0TX3c
	6pnM/iQRbi6wz5j9tEyjpaDizATxK1rRaYa4VouLvYDsQXTrtBIrRJ8lAq/ie92N1J5BoKcTkvD
	ne/VA4jqSuIhoOhkBD4d3N7OmUSiNZx52vqweryIEk1Skm1zRq8iJqsJ3YzTpxo3EhvrkNidPpg
	e4uWRPg9h9YmkOCo=
X-Received: by 2002:a05:620a:6f01:b0:939:c898:ce3f with SMTP id af79cd13be357-93a297e8f80mr202240685a.14.1789371991395;
        Mon, 14 Sep 2026 00:46:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:939:c898:ce3f with SMTP id af79cd13be357-93a297e8f80mr202236985a.14.1789371990860;
        Mon, 14 Sep 2026 00:46:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm25587273f8f.32.2026.09.14.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:46:29 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:46:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] interconnect: qcom: Make important drivers default
Message-ID: <npsrkq442luhxv3sfwjoojzfnnv4y4knsplnfucgdwj6df6uar@gjmbzv7yyldv>
References: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
 <20260914-interconnect-qcom-clean-arm64-v4-1-5b2c0e6a929a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-interconnect-qcom-clean-arm64-v4-1-5b2c0e6a929a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX0FXYguIqLBiU
 QcMX0rXbbhv6/UHNtQMzgt/xcM2zDB5Nqa74m/6+uDgQlIfgwu5diHQxllAEo9MCrEIteFpZ4Sv
 acdOxMdacZ7+fwuKYa0xOtey846pKcwVcS1iepGodJDTVhT09cmmCt2IUK9t0o92xLGqDuj7rjS
 abxAxN/M/KUDjfz3dfncUwIyZ5wPCv9PfvgD7bYZ5kRm9gN8gqzjwei7ZFM/0ehISeXNeS7QF0H
 2JWM7c8g49FSMytOj8IovckaadTHesIgVAgOjSeOKjPdI1PIsSiSGHnPLTLVzMQXNQJOtjVVsyz
 yX2BluTW3htT4PsAjUbK1g9fJiyOjIloJBXPahTxV+n05ReoHe01QIRJK0GnnM90ZRD36TqYsZT
 4hL4annet7TYvErYeYcHvZWrPa9gjbYUCStwRL1xk7FfnqJYCh1OxPLhDu7tBjiIIX2wBNTuMmp
 A3R42Qdqqxct/5MlUPQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7a658 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nOPaym-2Fu4dxh1hCxsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 35b3daWm6p8E9wbBeb7Y_bghxiE2MvOB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX6bzg2buZNDqj
 +fOwjz6M2eZSpOMVUVDgGNpIT82s/V97kLnEibMVrP3poDLB22Grkd3mgTcsIbLxRxmJIAm5Hvg
 Krrp1+SgAAdrmXbxM7ezWuVsTCNjZ1o=
X-Proofpoint-ORIG-GUID: 35b3daWm6p8E9wbBeb7Y_bghxiE2MvOB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_004633_919469_170DF0AE 
X-CRM114-Status: GOOD (  25.42  )
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

On 26-09-14 08:44:04, Krzysztof Kozlowski wrote:
> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
> basic or fundamental SoC feature: bandwidth management between internal
> SoC blocks.  SoC can boot without these, but power management or
> performance will be affected.  These drivers do not represent any sort
> of buses visible to the board designers/configurators, thus they should
> be always enabled, regardless how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch all almost Qualcomm interconnect drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
> 
> 1. arm64 defconfig:
>    a. Enable as built-in INTERCONNECT_QCOM_HAWI, INTERCONNECT_QCOM_NORD,
>       INTERCONNECT_QCOM_SHIKRA, INTERCONNECT_QCOM_SDM660,
>       INTERCONNECT_QCOM_SDM670, INTERCONNECT_QCOM_SM7150 and
>       INTERCONNECT_QCOM_SAR2130P, which were not selected before but
>       should be, because these platforms need them anyway for proper
>       functioning.
> 
>    b. Switch to built-in from a module INTERCONNECT_QCOM_QCS404 and
>       INTERCONNECT_QCOM_MSM8916, which as modules would not make the
>       platform bootable in most cases, and INTERCONNECT_QCOM_OSM_L3,
>       which when module might slow down boot considerably by having
>       caches running at slow speed.
> 
> 2. arm qcom_defconfig: Switch to built-in from a module
>    INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_SMD_RPM,
>    INTERCONNECT_QCOM_BCM_VOTER, INTERCONNECT_QCOM_MSM8974,
>    INTERCONNECT_QCOM_SDX55, which as modules would not make the
>    platform bootable in most cases.
> 
> 3. arm multi_v7 defconfig: Enable drivers necessary to boot
>    ARM 32-bit platforms, which are already enabled on qcom_defconfig:
> 
>    a. Enable as built-in INTERCONNECT_QCOM_MSM8974.
>    b. Enable as modules (other dependencies prevent from built-in)
>       INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_BCM_VOTER and
>       INTERCONNECT_QCOM_SDX55.
> 
> 4. COMPILE_TEST builds: Enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

