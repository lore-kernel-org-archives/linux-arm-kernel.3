Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA0FC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 17:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2TFrQqlwMVNl590WEvJJn/aZLgIQNxcVVRNL0lpuOI=; b=ez/bUZ5yMEyKTcBHuFSt8yYwUI
	1SHbm5/RhzCXV7IWFXVZX8aKaQh3un5vqktfdQiAMoBzlF2WsvMBkz/Ero4eX8TV/1E/qyyp20cMU
	Xwy2J5VCMUOdcRR7aXl2PwLCToZvZSqVdBqNTD5Zfw6hB6JFXericQy9MZOTwyk3tdY/iTt57ESOs
	vfrllVrkxpamCoUzhZm2Lr0O433rw48S/KzGQaQjOLMsKBcAspOHlxO2EmKO4SszBRPghJWv9s755
	PYnAgDf/3XO2yCV8iniwWvYfRRJn4vgAVCGvOLiW5UoeC6+rfM2MP2aDCnG9gZGHn4Qhr4MSsi94/
	xmRSBNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55Gs-0000000HNb6-0REh;
	Fri, 11 Sep 2026 17:42:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55Gp-0000000HNae-0TqF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 17:42:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWpsL589791
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 17:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2TFrQqlwMVNl590WEvJJn/aZLgIQNxcVVRNL0lpuOI=; b=C0EXKfWzS5XqIXis
	6Gb1tYFg4M1KyxffOLcLNKXvjcoAWvw3yp0yb0bHg860ixQOqMmr8cG5xhLRQY1Z
	FZl8ALfgs7WNaZYBypXpwx+kB4RUoEUBki1SD5qjE2eRjDdUaKvbBAdfusTjMLsr
	lQki3HL4VVM0qXdZmBSeXMcVvtMZHkx1fIvD3kpSy3kYW5rseeO/O7TK0KtumofM
	JYFvw61fm+R+WWrjLQO+QUQmMSEg2/4oCoiz1TU4vxaw0WZ2oUpJBokNCee/Ikqp
	Iw3mX7jYX9eBbdOhCDCg2rGSuteyJdJbKpeicqGCJDmmxynyDyH9JGoX0Kx7O3Il
	WpwOmA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdrb03m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 17:42:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86ab8302b54so1157457b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789148557; x=1789753357; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2TFrQqlwMVNl590WEvJJn/aZLgIQNxcVVRNL0lpuOI=;
        b=fbQ+95F9LYTK59aKmcc3IlWi215FXNOA6ZXSZznv8tXE5VE94LRBRc9mfpzsqtks1L
         LimGhQyQUI56stQga1ELWnKQKNFS9XBiSScyePADVnl8wn48aGuDdrBC+b6StY1/YM17
         i1LqJXuHTiV9V0+HrEpWzNoL574sWbhIWq1MvUqItLsbSNii3pJH/1MOnb/U/tfhVwEK
         /6+OVxELM0FfNPkmU109K+cVFcjKEH3Nz09J6dX+jceLxL4iWA4/CZ8xeYOYt2I75nyp
         KZAsFYd4C79VYyc5uQUwiJdFVManux48QDQFTtoewOZQ0ynmrWg9fIog/wTcxnv6ydzN
         0n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148557; x=1789753357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2TFrQqlwMVNl590WEvJJn/aZLgIQNxcVVRNL0lpuOI=;
        b=YmdVIDl8EPrWBrIO0vGUaTPiNu6o0zQJxCeYWx+E+lg57CRSK2v0ih8EJ1Xmm7ekop
         ViNo+7Op0BakMEVT97YDp6Y0GzsCQ0EO9G7fpeWF0XeMQ0B/Y87sUS0juqbKh2R0Skoj
         Pg/r1+aBh0A8KwpxMCE5ZrAWno3MEGlgLR/Ls6dzjKb+Vt4lP/HG1UOhP2krPbciSOvG
         H9/4zy1GAoD+eGSGy2G3PbNxAj/b8YbRbs5z6p2Fh+aN7B9FfmmJtmE1iOGR3BXvKpbd
         sbXT10v6mc/ihpJCqSokCT73NrA+DdySmByD6hsAmaikMcuRdG3Gr6o2iMI1YBpwyByF
         P7ag==
X-Forwarded-Encrypted: i=1; AKwUvBxcdoxpo2ECEyyPQTG2nMBRp2kHIVruNZaEU9Q2AnN0K64tVicw/ZiwwnGyX9BwK6AqqiyPwp2821eg3raWtrQS@lists.infradead.org
X-Gm-Message-State: AFuF++llh65+JHH5skUAwZwiI7WlralRJE9vMBaxXPH8IDQ+v46J6mYq
	bQxWeak6/hWxCfDcuqaYmX7OmNIdiYEpX2CdX2bYJYQM/vFM25PhDzg79BSwKxibI1TJebPhh+O
	b7xa7DNDYnOIvHwYni0fMAeTCl0CU05tT3U82dUTfi2fJg9QvKG8s9H/FnYyTyAHmdzd+JeNHIk
	JazA==
X-Gm-Gg: AYBFou2kc8/hrXSAUhs4gm3ixr5b+2QMO6wqYv/T8G0VKYG4MU60vSlv2VGg1ZeLCek
	6fmWFkcSmZvbLJe4d+c/V07uPsW5gNbmj7tIGP19qbCGjIVLwAJ0XXZPTKzhClIieqLaXYLR+YV
	AXMDcoU/tPU4gLIZiHym9O83Lwaqdyui7V8+5ozSilL38cs9spvlxrbOpTPszvzVrM8CKcd183T
	peNZE1YfQtaylCvhxOeCsd+uUuGLCLBpC9V1e/hPe/i6yicJMNlbX7tXn32g48l+k2Bf9aiZCyq
	Y+m6BzDamHafsOO7mHIjWR6pRUi06sSxBO8hW3TuZiKDETBYSxJ0CJfKs2QrNS5eL8/lKoXnumR
	F6vvop7Bp9UpcYe1N/IzYETNrX5aDuKPe
X-Received: by 2002:a05:6a00:4ac6:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-86b31ef6e46mr7785207b3a.11.1789148556922;
        Fri, 11 Sep 2026 10:42:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:4ac6:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-86b31ef6e46mr7785156b3a.11.1789148556310;
        Fri, 11 Sep 2026 10:42:36 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.105.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c49d2sm1515413b3a.10.2026.09.11.10.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:42:35 -0700 (PDT)
Message-ID: <e152a20a-c80e-488b-a875-404c916cccd8@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 23:12:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
 <fdfbd73f-8739-4845-ab18-c5f59898e192@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <fdfbd73f-8739-4845-ab18-c5f59898e192@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: krgujleGiEUoUN_FPhjW4SutrQx7yei1
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa43d8d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=KFINdI5Z0390/lZYonNNQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NZ9nq7LxGt4YLS7AZqcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: krgujleGiEUoUN_FPhjW4SutrQx7yei1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0OCBTYWx0ZWRfX9PUsSveMUiWp
 nQLyYjqOcdPj+JpFOsvRShYi/JF5X/UzVKvrHj4kqhpj3AG53+ejmUceTPM4uoBaYAUNeSrh11L
 7aSXs9njnKCmpbb2OXLryHs1P/KIli0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0OCBTYWx0ZWRfX0jAp27njcE7/
 X9D1pmkwHgu43pFCnuUKt9htlg54O1eiOmOqXeNsghhRgenWSRBYw7I9FbMEYT43TysQynTzz+B
 XCVuvIwa4VXBZGbRXAFpvwGmhh9ZYogcDDfOb1BW3SUNkubcGv+5OlCnsFcRU4eKl70zRFUi0dw
 eqwwBajRbVwt+faL6YfF8EAxoNmp14toEPhVTAq74Z0bHyBk7ickBB2RkYj+40cwEw+oqpB5oof
 4RqFw4AMrtIStngNd1euvQheBCAGBqiEF1oFiaVTHdYM+San7tC690CQYYjFhNNuAxBO0WTcT7p
 yj9sVU95H6Vx1Y0kmoetiwyY3iw13YG1qd+LWQiFhKPMQ5OSkvi3qTX0UGljqbgnnTsazx+bfqi
 vMXf3kFI2yhTDv7RzKeXiLC+I5+GA+RLJT56xZvzu61OS71JMOsyasuIjSQowYhQDRsqBVzp/+A
 OI0GUf94MoTkyGTvVpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_104239_285887_08EE6566 
X-CRM114-Status: GOOD (  20.90  )
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

Hi Konrad,

On 04-09-2026 14:22, Konrad Dybcio wrote:
> On 8/27/26 7:59 PM, Praveen Talari wrote:
>> The I2C driver currently assumes a fixed source clock selection and always
>> programs SE_GENI_CLK_SEL to 0, which is not sufficient when the controller
>> needs to switch between different source clocks.
>>
>> Add the source clock index and frequency to the I2C clock map entries and
>> use them while configuring the controller. Request the required
>> source clock rate through dev_pm_opp_set_rate() and program SE_GENI_CLK_SEL
>> with the matching source index.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> [...]
>
>> +	dev_pm_opp_set_rate(dev, 0);
> This and the below call are unnecessary, rate and enablement/disablement
> of a clock are orthogonal operations
Yes, you are correct.

However, in this case the rate change is primarily
used to satisfy the voltage/performance requirements
associated with the selected source clock frequency
rather than the clock enable/disable state itself.

The runtime PM handling follows the same approach
currently used by the SPI and UART GENI drivers, where
the performance vote is restored during runtime resume
and released during runtime suspend.

Please let me know if I'm overlooking something here.


Thanks,

Praveen Talari

>
> Konrad
>
>> +
>>   	return 0;
>>   }
>>   
>> @@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>>   	int ret = 0;
>>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>>   
>> +	if (gi2c->clk_fld && gi2c->clk_fld->src_clk_freq) {
>> +		ret = dev_pm_opp_set_rate(dev, gi2c->clk_fld->src_clk_freq);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	if (gi2c->dev_data->power_on) {
>>   		ret = gi2c->dev_data->power_on(&gi2c->se);
>>   		if (ret)
>>

