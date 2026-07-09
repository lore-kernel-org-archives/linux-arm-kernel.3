Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BC1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhHFYSLcv+6lYQ28t2RolA7btajCBASXtU6eML3rNHg=; b=MSyOaHz2GHanq4PeqRJJO5MetU
	t0SXu8T3RoLH31+PyMXBUde4vkAIVd0I1R4+8/F5RiPK0gOi49fN8vcSZcLI/rzTrcc046Wmp9C8Z
	ZP9YhVu6zgNmmLQIs3O+5THJYe4ARaMQG3sRoAZRRDBoemgd8971rD/IwHDu15IvEewol5+7fknap
	qwrZwnCRE44GahCu/CGjKyWVxXwLluklUW13iRIzBkXEgLWw9zTKwpODjK8+TWaS7WhXlocOlZBIM
	rv2fU0/00nWLbmIHhqW0TzD5vR5nNBXOJ7eFTlK3/3ppdEKpG+JZ+8CwrxG/hueCH5YSBrrWy0Y4e
	3Z5g0WpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1who8s-00000002SMg-0ycs;
	Thu, 09 Jul 2026 12:46:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1who8o-00000002SLQ-3Bg1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:46:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNUMT1672688
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 12:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vhHFYSLcv+6lYQ28t2RolA7btajCBASXtU6eML3rNHg=; b=L0/y0OAl+AJJOS7f
	w1PWvdtiYchzvRoPPGZqJ5PC98dZZjGkwHWPnmyI6lPB4JZ+Ch5QzTuUsb8GAI3S
	uoOyMLGYwDBqyN8db+oziIhRKWnYKbKIYpB4Ugdo5K906W+JosP8C/9peN2Uic+6
	FrUTAqylERxjEUAC8DmesG62n6SDOCQ218Ur2HHgA0OdxxF/3QFMpg4n4HUH1DXo
	pW0BKIKVtQmUVYkWNrYqohMTHT1rT8KyUjqW+tA+tTm319j4f3QpsHe8QNaOfi/j
	80OoPdp1MGq2xuPTsx2olI93kDkLY+qvmWo8xaiC8KuMDkvJEPhRkOO05CRYVxZ5
	Amnd3w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsca56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 12:46:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so1923159a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783601162; x=1784205962; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhHFYSLcv+6lYQ28t2RolA7btajCBASXtU6eML3rNHg=;
        b=BwuOyh6XMkAl3grEF0T4hiC2VHkKmqjjhgN9QrFuNd7GDMC3Oup3aGw3wxbT7GPm3t
         ehkOsv5U0fNekznLqehF4Usspa/iOZLj9v/ATOdEd1G9QnkFJYV7x0Xd3S58ZxmNGMaR
         hquv8iW5DGE71+PXVAkI01/vgnS+lkf9s5fulhIo6q8xzswztgb2YZV92XVftV2pBdHs
         d0H+B6FuxbMFW4UzGZi4mdGdsswspY7XuVCm9FfPA6jVPy8K+Zrq0Uy2fCykjEX/wXiT
         nldbSjU3vKeUMkHnCyQparn9g1DxiKym/fsq9Kaz/Kevqsw5SF1Kuw21nt4hFMp/1Ek9
         iKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601162; x=1784205962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhHFYSLcv+6lYQ28t2RolA7btajCBASXtU6eML3rNHg=;
        b=jjUo9qrLUwvbwxtiV9zA9x2zav7srjLk0wdrKXWmtL+rwdoCYotVmWIcYj8rzaLTLs
         csBoP7IXm9DeUAKZuJ6SVCXXs74X+wPJE26pNVjNr38yImnXFNM4LCu2TNfbn47TfqPy
         7+oj/CnDEmcp78MTB0t5n11h7yh5l4vSfpsm+Gr4P85KtC9s/OzLyWjrVRM2if+uwvlE
         ZXHEOEJJsW0pyokW6P/dXNmmq+F3BqBujGtZGIdTgy/wIckcB+2iG09OyxpdssCBBl75
         falXcT5hPxg1/CYaN9o0XRbk2hprCLwd7GRMwab0fiM+UFfjPv7HWsoZRf9eAlfH2bQq
         D1rQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAf5KGQxtXJPkrV2GUJGtozavXc8nG94ptld6xx6b7gVpkVUH7NAGubHUp0jgzdEqUIlKn45nS77I4Pk3gOWZv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7rAL657OX6eFalsbh1/99R4W1F/M57fJGtSZ0nKed8Rc++NUS
	0MxHR2cuwZVmWMbYADlmKWm2WFWuznUUcQnF/I/l8EZrCXfRuTNX67Y/xqaHp5ou5pOaH+HJGpT
	NTA0JRYABhpuwDrpNKYnkElpXYjEN2oyfkWoE8uBi8y/rJ+ShJtPLPuEbcTUXrVtJ3aXDLEf4SD
	KG5w==
X-Gm-Gg: AfdE7cmARRKI/WunYHyXdpfEG4pPM+vH1JFV6fJMb9g/QT7P1JkmiLwvCdvbtTniXg1
	t40w2OZvGV8nZTku6d/os2BO7zTZePISRKHylfoyLwHiRjreVAbrE8CgyHGz4uYfJDxNK8PPuZt
	oiZmdnX5O6oZAHy05TQcvz1JEaSmijFrz1Ua4QK8Rn0v9sA45dtUT8H9HCvAA3Z8hP5O2PlQEbE
	z0ripfBVHqzsVKofBF+s9XJ1xkTRftfTd6lSOKDAGJ8yVDsEw3zzYBQwIpKT3iXA0d/No+tc87a
	VEw3DVXPNsoSmLxWUTo3WXmv4PWkqLipQpey0OoNddoQL+emuIDzTXdVOPY5XUyTWAKhHN2TTgd
	9ZdaC1SM2GgtWUPVHDAAG7PoPyKfc17cxZgSF+htLq2s=
X-Received: by 2002:a05:6a20:3ca3:b0:39f:acae:f12e with SMTP id adf61e73a8af0-3c0bced482bmr10459359637.22.1783601161849;
        Thu, 09 Jul 2026 05:46:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca3:b0:39f:acae:f12e with SMTP id adf61e73a8af0-3c0bced482bmr10459285637.22.1783601161268;
        Thu, 09 Jul 2026 05:46:01 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.111.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac178dsm31739101eec.28.2026.07.09.05.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:46:00 -0700 (PDT)
Message-ID: <bc3afb69-bcf0-4a73-a9df-4321c32707ea@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 18:15:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
 <5eecf3a0-b608-4057-b400-236f6952b380@oss.qualcomm.com>
 <ak906CqHYDooQTVu@ashevche-desk.local>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ak906CqHYDooQTVu@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMyBTYWx0ZWRfX016qon8kdHkK
 Oxt4+zzNXLM/aKz2eZRZQ9/jnQ2x2qYPC6YLwP01PK+wS9M7cQu/U9mch6G8voOVN9atlhOIx+4
 5w392oG+G6GAQQI8mEidmtybOi872cw=
X-Proofpoint-GUID: roYK2gIYm3p4Uwl8kv9FavUEOPm3Jd41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMyBTYWx0ZWRfXwQkIyvKGPqWY
 6lwh/uWwFgx1W4FlAjGH1tJ4h3QnfHnVZHxIEjEjFllcCov7ejavcT8BxKYSfcgmCw7P2m1R2BH
 bbSgEM0tumZK52epOCzT1w7PqTPp1lAzPiSJ2YQNhbScUxvOwHTz/ur4Me1WWdkRL82u5rmmJaA
 fCOf2CkHFbPYIrjZVevKsoJoNNAZQkVA6ov/UhYC0/X1I8G1zMq6pUmli9YTyOrXeMQrKCaoyaJ
 pZiN1WeYAQZZmgRcZrbZklvTbihb0+VX7mjYpH3eNFjMao531de/oHzGDgNIHJWxlFYYzs/ZMj4
 gymBeO3O1DQ3hhjPe37jug2ibzQ/PNmZFq08wd+GtmlLxQVkYmqWivJo5hQ2WAc6zmVMQqT+wXD
 qDao6zyF+XJiZ7viOtHoKBsalI9wBoDos7qPqBlvVKf7PALhq3kHISXvT75z4NR6S7WnzTjWRKX
 t+IwZTtcyQXsY/KWN3g==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f980a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=vz+FLylpEn3mlzyIWlmD3A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=2TZWhx8y46JuiruMumEA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: roYK2gIYm3p4Uwl8kv9FavUEOPm3Jd41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_054610_951492_22B22BC0 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Andy

On 09-07-2026 15:46, Andy Shevchenko wrote:
> On Thu, Jul 09, 2026 at 02:22:17PM +0530, Praveen Talari wrote:
>> On 09-07-2026 12:23, Jiri Slaby wrote:
>>> On 09. 07. 26, 8:25, Praveen Talari wrote:
> ...
>
>>> OK, now I miss the rationale behind the patchset. Neither there is a
>>> possible code path to actually test this?
>> The rationale is that qcom_geni_serial_pm() calls
>> pm_runtime_resume_and_get() which can fail, but its return value is
>> currently discarded because the callback is void.
> So, you take the solution from a wrong end. Just get rid of .pm() in your driver.

Ok I agree. Now i can control resources via PM runtime APIs from 
startup(get_sync()) and shutdown(put_sync()) APIs right?

Thanks,

Praveen Talari

> With that, problem solved. Really, this series is a road to even more broken
> PM solutions.
>

