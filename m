Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303ADC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcl6sGfOXxz2wVCK7AnSLNHITansIH0yOzXR+7u97no=; b=W7WlcqEPzBEs6uu1FC2gjDiVWO
	zrt6GjWZmf0nVZ05FvkoXzQwHJv+LAixVMwixGV4mkhxScF4OFtfKIXh7OdC/sCZk8YIuQ1UjMUjK
	JvQLKRykdOCbcnJYIwYkxK8Nb3rC0M/1wCvQ5/6waxRn+Qu0YB4xcXTJpNIlVJTaBmYUsD6R9HmBk
	sbshNIqZjRi8Qo3sxkUvk3/G2pHRUMkMOgI/pTyU3k47iqegUtViqIudf6pdCMfWSD7TfNSRLJEPR
	xAsUdc6qPTMagBg5/0YhKq+Vsmk94uDtub0q9ITVoZBeZ8o3jh4CElnRQB67n8vI7S7Ah0tuBOEK/
	DKTGZYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6uI-0000000ANwO-0OOH;
	Thu, 06 Mar 2025 08:48:42 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6oV-0000000AN0K-1koO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:42:45 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267Sk7N015077;
	Thu, 6 Mar 2025 09:42:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	mcl6sGfOXxz2wVCK7AnSLNHITansIH0yOzXR+7u97no=; b=xAzJdlwnXlBNm1Wa
	7Ife+ee+VgwahclxL70yp7tvaLJa4H1ObaqD15ZCyqlBMH8sFnRdZUvn31Mp/SYY
	A6pIR/FJjc7B6PXCWpy9ykshds9Lejm8g+cCQeGONwjQjacbntQuag08ox4s2mY8
	ddSQ/IRWGPpgvpnKCy7O/ZJ9kLoESBL6G08fUFrN7asYyBbMFxOJt7yJNxjYNB+k
	iILuXTz1faI7GfE3vI91cHBsKtfVb54RKddtFw73nEowe2PMhzDlVNnwOq6/WEbb
	xLIadHIi8b/hnQpaRc5nb2vNJe8YRQrNEGYudS/Re0U0EgUNScrj9SFkBxGHFMvf
	Xt/NHA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 456krth50w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 09:42:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 54F7C40052;
	Thu,  6 Mar 2025 09:41:17 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83009441E5C;
	Thu,  6 Mar 2025 09:40:12 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 09:40:12 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 09:40:11 +0100
Message-ID: <32aad66e-a9ae-493a-8bea-a06e096c88f2@foss.st.com>
Date: Thu, 6 Mar 2025 09:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] iio: trigger: stm32-lptimer: add support for
 stm32mp25
To: Jonathan Cameron <jic23@kernel.org>
CC: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-4-fabrice.gasnier@foss.st.com>
 <20250305144539.54a75689@jic23-huawei>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250305144539.54a75689@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_004243_747724_8A03062A 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

On 3/5/25 15:45, Jonathan Cameron wrote:
> On Wed, 5 Mar 2025 10:49:30 +0100
> Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:
> 
>> From: Olivier Moysan <olivier.moysan@foss.st.com>
>>
>> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
>> this new HW variant. Add new trigger definitions that can be used by the
>> stm32 analog-to-digital converter. Use compatible data to identify them.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Hi. Oops I replied to v1 without looking for other versions.
> From a quick glance feedback still applies here.

Hi Jonathan,

Thanks for reviewing, I've noticed your review comments on V1, I'll take
care of these in next revision (v4).

Best Regards,
Fabrice

> 

