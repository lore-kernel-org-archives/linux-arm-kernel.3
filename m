Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B86AD1D86F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 06:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwIvTqC0vtcEcT4pWezqNiZK3gnYXhecWCg8UTidylM=; b=4gayd0yGZ6rPIQnUC/6Z6YfkhD
	+P1Hs0Hdfx/PsNv+1V4kiV38P6xVHDsu03sLzqnauveLlOuUZWUDEqTYYoDAnWvSG6ECYx1VG4T9r
	ycLq5Lj+yA3EUQiZlHwwfNLy2yv1x8YgJiuWfPkb35LHRebXv8cPkjHQy6wGmmRjdppauLFGvJDjA
	nteS/Ey9x1KdYQj0bCl0Q2i7sqvyBGIDt0+ANxgsQila7lDMgb8Xr9BPKURU7TxutBcY42WAbzDtI
	otqPTzDmvqyDg4DFNw/0o9rH++tSPgAlmbWkSR99qJeg1h75p4l8BZeideeB4uO7FF9sg0KQe27qw
	5+8OiS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3C2-00000007aKe-0fIT;
	Thu, 04 Dec 2025 06:51:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3Bz-00000007aKJ-1S9K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 06:51:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B469Io2825019
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 06:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwIvTqC0vtcEcT4pWezqNiZK3gnYXhecWCg8UTidylM=; b=F8kdsRl5LEWN6Tn1
	5FHZaLrLxQxo6Ra1PVUCwutZw95KlEYi7QFYpdKATUS2mFCN4XjCHExVsRsnEb44
	JC+qVhYS/ltNcipCo0tQwqtYXCRp6tmmJlX6IIQ8kuAUl9Sjfm58JFlcubu6EgzZ
	w9yovQTDhluuYULnJAkhHXIgwKct8Im6KmyCRfHS46zLONINXS+CCReEGa4tlz8u
	6vvdPDaWaFvOfBXArh7m2ZqQmqn4tHMjUmKgjDW0i7n1z+wpcnXkwRrYzCW5bixI
	b+i48exmM7ddaX3CnAPIldhqGYxsCD3Qesban++Vq9HMGzJcdgKfAJoFGk/IH7bL
	HNjuog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm12b2jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 06:51:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f48e81b8so10089905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 22:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764831113; x=1765435913; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwIvTqC0vtcEcT4pWezqNiZK3gnYXhecWCg8UTidylM=;
        b=UsTd67RH0ePcC0H/wxD7JvceMUXxyKOjP8uQkt8GWHkKVFoRL4Je+qovA1D8v8pFl1
         qh2BQAmc70HBqxEFEGfFmt5bIBVqokioazhThQFHqKmwQZ6Q/2HHAq0uKLw4OzQSUjXe
         RvVuC5d2WHWb1c+oNShGRDvSe+qkQFj37nzHqbT8kUTnG8id0MUWzy70tHkD0+A8Bf/N
         HGCF3WxDYl7tdVKuDlcQts/G5vNtN9k0A+gmFSQKYhJI/bsFnIYyMqKisDqWNiCEcvsz
         iui1pOx4Er8tzdzBFx83k/wDYYOSrqMG/bEoKsCwDQtKdSk0bEjd1K+dbr0kVkSiaWRL
         XxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764831113; x=1765435913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwIvTqC0vtcEcT4pWezqNiZK3gnYXhecWCg8UTidylM=;
        b=kLLDnLCBZlVumK9K9DkfQn7NiVD8XzY1ejMnuC2XvyZGxVUmgq98SuTxIuO677iUT/
         zZI2/GT0PNk3z9u0v8c2fgAIcx0iEJuDJeqfGldLhxkoPDS39NJ5TEplq4DeBGJ4d9UX
         aq12Ikbgozq5b3Ap4JW8MyYGDY0UKJnDTQkCbBa2Og8zaOdP9ExhjQqwQVFRezgHH8qV
         oNDYIpn+IctyWFLjS/sxGoe1aBXtdcVwUDA+v6MBa4IL70MbXpSmwNAf2xUX9HUiDBGc
         SdY07lRz7556jifpqUH2JBFJUOKPaMZs3n1U/kXfSHn7jE0XyZCOllUkONlO3iGO2TPM
         StDA==
X-Forwarded-Encrypted: i=1; AJvYcCXKZQ6fo+G8H++iJnQbQTblHlEsw/xG+ovPmHEXy+h8n1B6th1qmyds7qHBVcZFo/Ssph6eJQX9lZP2I+q83GBC@lists.infradead.org
X-Gm-Message-State: AOJu0YxWgDzPSAePeB6lkOh56UgahY4JoHmn4/SVPcVIts+CoHpbOsRR
	rYhUWCZyAlWMNiOa4NfqFndrkwvd8asq6Q/7CIKNpZRZ0PIEvnU84PFsxQLAWkY2bqcHS6wKQgm
	DwmeHV5QJm78ZeIdBP/XkUdkCW3GZEV+dsmBw1NOrj3uX7Q88DKsQZetOQcauuWQX1Yvboe2dc8
	3TBg==
X-Gm-Gg: ASbGncuJk4cceROFuyK1rdwPYYjNlIXppl9f4ZEXBJWpJPUWs+Un7fCJkfaMXwro/22
	QBNSOAUnsC6Hp62Tnyopf0Jj6aDTzZg4nUxm6j411b+nAOpjpO/d0Spztr7GRmnRvC4vdC/HqeN
	Q6KG7xJd7AkcZXia/ZvYv1AykW9Y/xSXClJhkdirCne89MuqTIZWOiNgfWc5VOVbpnnmI/CMWiw
	6jSVC6/WEOChYfKAGH5YUWJdNy4GQTp89JufMU5HTnquPxH6v0nfs3IyAxNjnz6YYPRoZLoInwd
	l6M91A5x5J/YY3wua9QsWr8yw0Z/d2NCJhTf6+x68JhkwshHmc+Qv5nOdZxYJWJzY7Z9+rHMWzr
	0brSZwX5JJn3RlOfOFFLhVCIbdMvp6EL/57CYKw==
X-Received: by 2002:a17:902:f544:b0:297:eb3c:51ed with SMTP id d9443c01a7336-29d9ed0b4fbmr26080735ad.16.1764831113149;
        Wed, 03 Dec 2025 22:51:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK/6jD4CnU7c208zP0SLAeyIoeJRxRQ14N6apIAj0JxvDPjIPkL429Mbb2KAq5S0NdCutI0g==
X-Received: by 2002:a17:902:f544:b0:297:eb3c:51ed with SMTP id d9443c01a7336-29d9ed0b4fbmr26080225ad.16.1764831112660;
        Wed, 03 Dec 2025 22:51:52 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4d3b5dsm9082855ad.40.2025.12.03.22.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 22:51:52 -0800 (PST)
Message-ID: <db8a9c71-8400-46f2-892a-a9a8adcd8dd0@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 12:21:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] clk: qcom: Add support for VideoCC driver for
 Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
 <850c172d-66e0-4d28-903d-fbcef7ad7444@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <850c172d-66e0-4d28-903d-fbcef7ad7444@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1NCBTYWx0ZWRfX5lJj4+P/hq8r
 DyQ2QeJ4WdCgwQdOvBK6RReHW+/kyhzpXtUzMJ0N3TaZuPVUYiTsxD+ev8HaNoLjsJVeWhNZogl
 kT9nvgrL4Ug5G9IrkDrwxTGdzboX+0a6qFIDYVt9EdEVwxToZRZTdIFBFcjPos3ILnRCJ6JBQTy
 2tUWGwrmU9dQTQCmVCnSwqvUO0XfhVLpGwkxV2kq+6VGHivR7f9xhjlbxmMdYJQAHcxBFMk22jI
 7ZSygOU1clpvW+zmUXNeBE1e3ze79ViGL2ps/2gOvzyC5CN7Ods7qrz8PxZ4xrdyUOJp08HeZ/G
 xAzMHP5GnWdsgVDKJhajGU4+GADln8ZnE3P7X4dJY7aBxDIzPGmG1Q1USw/8gD8vjF+Zo01pRYh
 LGXPPu+6Eh3dlDsBgszS3PUhFFN3ug==
X-Authority-Analysis: v=2.4 cv=JY6xbEKV c=1 sm=1 tr=0 ts=69312f8a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6AvYVb4XUzzG-8MtstsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: umYnTH5bufu1e_J_M1Pw7rc6bR4mgaUk
X-Proofpoint-ORIG-GUID: umYnTH5bufu1e_J_M1Pw7rc6bR4mgaUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_225155_527999_10D2B230 
X-CRM114-Status: GOOD (  19.59  )
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



On 12/1/2025 6:45 PM, Konrad Dybcio wrote:
> On 11/25/25 6:45 PM, Taniya Das wrote:
>> Enable Kaanapali video clock driver for video SW to be able to control
>> the clocks from the Video SW driver.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
>> +	.mem_enable_reg = 0x80E4,
>> +	.mem_ack_reg =  0x80E4,
> 
> hex must be lowercase
> 

Sure, will fix this.

>> +	.mem_enable_mask = BIT(3),
>> +	.mem_enable_ack_mask = 0xc00,
> 
> GENMASK(11, 10)
> 

will fix this as well.

>> +	.mem_enable_invert = true,
>> +	.branch = {
>> +		.halt_reg = 0x80e0,
>> +		.halt_check = BRANCH_HALT,
>> +		.clkr = {
>> +			.enable_reg = 0x80e0,
>> +			.enable_mask = BIT(0),
>> +			.hw.init = &(const struct clk_init_data) {
>> +				.name = "video_cc_mvs0_freerun_clk",
>> +				.parent_hws = (const struct clk_hw*[]) {
>> +					&video_cc_mvs0_clk_src.clkr.hw,
>> +				},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +			},
> 
> The indentation is a little malformed 
> 

will check this and fix.

> 
>> +static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
>> +{
>> +	/*
>> +	 * Enable clk_on sync for MVS0 and VPP clocks via VIDEO_CC_SPARE1
>> +	 * during core reset by default.
>> +	 */
>> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
> 
> regmap_set_bits()
> 

Will replace with the new API.

> lgtm otherwise
> 
> Konrad

-- 
Thanks,
Taniya Das


