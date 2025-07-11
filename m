Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBE8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zODF07FEndKVYerePzf13yZa0v9IMBpC/Vm6umRGgcQ=; b=bg0zWenEEGyiqWe4tE2/gBfAyD
	uwf2smnA0FhyQ9P6FpPZNYZAiM2TPSLAFhDc/rS+E8a2uOavcIHBZqxCtrfY1uC2v4iJW5WRNInP8
	GqjxjviFxlgB2uJd3OnnXc8xKCvohcvH85KTJqsTX0i3Apl+wy1ko4IE7hfspOdPbFuZuc9UNykF3
	PA6q4mmi/NoaXQfCqGjKA1fryKglMHoQDiRaLzy24QjQkurGS3FTZ0+q5Ps93sarl8kj25latHLoq
	TGgEYuqvCtJFQRuRtEMPifp34NBWfT+Oaq3r8h9hfA/0xw24zGAvjLAi++Wm4h4mnHqvpVbXhIDuU
	ZQv+eQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaICo-0000000FTAb-0fkd;
	Fri, 11 Jul 2025 18:10:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHt4-0000000FRdf-46Vb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 17:50:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BB1LhR005677
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 17:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zODF07FEndKVYerePzf13yZa0v9IMBpC/Vm6umRGgcQ=; b=gApSY9r+2eAhMTb/
	78i0vkS9emlIFK2N5TD+V0KqbqrE+DJTruHeob27jHnXjtuMt6rEH6OnMoIKrZxX
	3Jq4Hr5MiTU8vX6sUu6IL//2V4H3anIsaXpeuOu0QaYGh6EQ5x45kEy0GonU8Lv/
	nLN1jzwClGo2Lr3s2CEXqhRwP8bFtWyp5WkI8xz2IMmP/8P/jxUqHbb+orW6fkJb
	WtBbHDz+O9dVEaTTVpNR3QLe7fR3brxtWx7elNWmJgiibuy2YvnEBP1TFmDrkja+
	dCF80k5Kjn7KMZFjQb1pJYRpF25bm1DDZDkX3l+rxZqa+NFHLEzIEUJvOagwF9/t
	k90SgA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1c593g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 17:50:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b3ba7659210so1767300a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752256206; x=1752861006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zODF07FEndKVYerePzf13yZa0v9IMBpC/Vm6umRGgcQ=;
        b=vWJRKGFP/y3dXhne1piF6fnBYnUESqHdTMT4By8FrrpyXReH2NWBzx8WO4e0aA87XZ
         LqOWuK1eUY9T++xdqYCewTDdC+QzMDEjI0Fi+TBdvMh/u1d5+i360wxFu0c9T4v7Fa9w
         jBlkkrhMUNGcze0kSBTzXLNE+F3l0DLiKlJS0eofXS9N3IGnFyqHawOleVHN7UWhSyli
         +Q7w0A8+pqsDkFXbZ1GMi3gcH88sHNfHStV6LBBwiR8+xsBZCx8dRtH6/Zo4qTQaTTw6
         frgdHAxfjGzoTKwe+c9Nzn4bmW++lag8lBmMt0HN/QTqsRwnYkqSsUY3k059lpNdvphL
         O79A==
X-Forwarded-Encrypted: i=1; AJvYcCUbo5RPCDCBaHNnDrKfmIoUVHL3jiOXDswHKLN7BQReAthle1Q3rCo9bpOMyWXhsn79gZrtDAYQqIJaU18AEzBa@lists.infradead.org
X-Gm-Message-State: AOJu0YzI+U/snAcDs2E4dKMYtKIvcrA4UJMwynzOEhtwA2TJstYUPOda
	hFNaaQb4CQDgAyWYCk2mxQXSloWTwHxO2Z3Gj6ZpLjXTz3Xy04G1haNuLSYOCjxPNx0IDrWyQKc
	ue26q3ZQS9pC4a8k2KQZFfsVaCnYXv/at5tt6i5dwddt1CyxqlJ6jsuaahf8SNUGsUFEKOP/Tsl
	XNjw==
X-Gm-Gg: ASbGncug7pmLPO+1nQwVnXfAVQTEOukSTzy04TqKD91aeIAtZiYPKTXTrU0RqtQchS8
	kO0aW8Oc0DmwUg+Z/QPXDRS5gT7zZqMhHQW9tbM/PHqljsSMssgcfTsNr3gcvc8+2O9p7nqLZQz
	HtY19NM8HGCpF4dgD4OqhQBqg/aTI6sDuvffvgA/18gd+sytJO7Vr4NbUkHlgHZzbOtC3nG9Wrb
	l7Mrm6uHJMaBR4QgDoHAp01rg9VIhBXW1XrqAfnhZ2gyIiANd/AYgIpBG76wrM6R/tCDW5bTexM
	iPlf/1BAEXnCwF3ysW4fGj91Hm3TYYJSvkYjpDWUcgKgg0PIsi/HihN7Bx5uQJiThaqrYl8QHg=
	=
X-Received: by 2002:a17:902:f545:b0:235:efbb:9539 with SMTP id d9443c01a7336-23dee1abb0emr63643135ad.17.1752256205844;
        Fri, 11 Jul 2025 10:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoW1pfrpu8TJ9bIwQOf4KOWgHALwSOkO1BYsTZCrJkUsn+7Lrx4ekRpFxTdtXkf6n8J7ntUA==
X-Received: by 2002:a17:902:f545:b0:235:efbb:9539 with SMTP id d9443c01a7336-23dee1abb0emr63642755ad.17.1752256205266;
        Fri, 11 Jul 2025 10:50:05 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e160sm50153985ad.172.2025.07.11.10.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 10:50:04 -0700 (PDT)
Message-ID: <42a98c8d-7287-8aa1-ad39-4d5b79e177b7@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 23:19:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 02/10] dt-bindings: power: reset: Document reboot-mode
 cookie
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Andr=c3=a9_Draszik?=
 <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-2-b2d3b882be85@oss.qualcomm.com>
 <20250710224740.GA15385-robh@kernel.org>
 <cdadd6cf-18c9-15c7-c58a-b5d56b53452a@oss.qualcomm.com>
 <454c8361-151e-42b3-adfc-d82d2af62299@app.fastmail.com>
 <28f277af-9882-2c70-5156-123c95adc2ee@oss.qualcomm.com>
 <b870ed33-7d4f-4b0e-a9ae-b9c374ea854b@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <b870ed33-7d4f-4b0e-a9ae-b9c374ea854b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5U43rKay5hMXJOGPuL7tkukniEFSBiy2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEzMiBTYWx0ZWRfX49JQ+6XXcsMA
 O/Ura7ldCBpj2QvB7wjkUnlkO9FzaS6ehaC1hrV3H+vkyjJTUA/CrPoJwjQpjsoyjC/CFmLVyJg
 Xcio8+WMkw9gRhc+yHbXxSZ4a1wwjigDZtD1k6CSUP5dqk1X+P/zJIneq/ZPjtm1ckh5izgJDg3
 JZIQSicE/s9WwTremOWp3aeKEKVpoKYY03OikQMM/RClob8XkGpBeIYkMmkXQYqWe6fFfGlo7S1
 Y1NCI5gCHln9YDdGuQ4kM/BaMyL/WEaSxY9TiQTPHAgwQbgrSo16qT6MKOpe02ZF62JqQkFd/ne
 QS0gWCOReo8BP1RkWHH36gZx55fZP1yhLdErMQBOwvxLn4Fd/w6RPfJQpAX1FZR6skc5rPGQoD8
 6zkhqt/REFa15vwjyyvKU4nNUaRYf7dq0oA9Stjcmp92go1iTM1mQnIEmn7mpbwa5ueC/n2K
X-Proofpoint-GUID: 5U43rKay5hMXJOGPuL7tkukniEFSBiy2
X-Authority-Analysis: v=2.4 cv=N9MpF39B c=1 sm=1 tr=0 ts=68714ed9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=xZdgJlt2tE-EQpnRY6gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=697 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_105019_136181_9B243F4B 
X-CRM114-Status: GOOD (  16.99  )
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



On 7/11/2025 11:09 PM, Arnd Bergmann wrote:
> On Fri, Jul 11, 2025, at 19:00, Shivendra Pratap wrote:
>> On 7/11/2025 8:14 PM, Arnd Bergmann wrote:
>>> On Fri, Jul 11, 2025, at 14:32, Shivendra Pratap wrote:
>>>
>>> The distinction between cookie and magic value may be relevant in the
>>> context of the psci specification, but for the Linux driver, this is
>>> really just a 64-bit magic number.
>> ok. then if i understand, this binding change for reboot-mode be dropped
>> and driver can internally handle the two 32 bit numbers?
> 
> Yes, if you can easily keep it internal to the psci driver, that
> would work, or you could just change the callback type to take a
> 64-bit number and leave the interpretation up to the driver.
ok. thanks. Will try it out. 
> 
>      Arnd

