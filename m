Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64349E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 12:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QV0VId4XPnG7jXmecEC7q4/L14x/wV2XNPe87e8Gr7c=; b=tJXCWS/SN6k2HcyfatOU0xCoSg
	+uOzx0fZHbu3EwqBpCTsKV6LON5fRrMfcPN70enX8ZZqUq0f59bBZOoR+QGuRjLmkCmwqVwU6u1GP
	HBwOaDoF9Vx+G/V5i9pm18trhJmX0jO/omY7wtwGNJYVtdMGvIMLOC7heyuBTaVIvBWLkWXlK+ZLm
	s9wBwtEisxqB9iSskUDcZKnP4VArW0ECS9BX++lkl5JmcBK+XRNo8epQXjUG0dmoJViZqDD2MNCKn
	svh/InFaC46IV6B47PBbmldhOJ5Kmhu4w6Ad/vqKFZ1WCO2ZM/U4ZS6O6s4RKJmjGffdyrwpYlGAT
	lrlQVyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPh86-00000009xkC-0y58;
	Mon, 23 Dec 2024 12:01:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPh6u-00000009xdN-3l6Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 12:00:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBVfet006925
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 12:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QV0VId4XPnG7jXmecEC7q4/L14x/wV2XNPe87e8Gr7c=; b=pzND3xLs1mZbBQfL
	LFyQ0K5LxvUjhVkWgE0R2lvPpY+y2XbReqJcUcZ1qNSrkyqLfnu3g7uPzF1s46sI
	N9N+eFbR/xLK6kHCZnIN3loij25D8AKH+9W4gNhIdiWZR7MZ1ONbpS//yNq8F+Nn
	O49TiQZz69mEev4aJ4WL0uPxWOFMviQ/1D8aioF27Q8WIDDJWLiFzuft92DCPqSD
	MXDrJlYJ6yfzDrmKejUUkjSpKhDL83UO4eMJ+Um+P6VrA68XCwNOGaZ4Fm+SUvJN
	3VgBoID+wC2XZt6L6R2nRMI9hEiIWcIZPK+ylQ4hyBu80mBVSi6L5V+hTKXSH0eT
	IIkCJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q72n8206-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 12:00:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8e7016630so11952796d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 04:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734955229; x=1735560029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QV0VId4XPnG7jXmecEC7q4/L14x/wV2XNPe87e8Gr7c=;
        b=ajj0/lacnJLhcd9JFH/+TkwDL+1W/cgUnl9M8UsX3QV8lox3Jp6gc3HILGrRIDqnfi
         7zqIIDiRzGog9LzijDcHhAhue8h2wiY523Zwr7ejFgoE/rPiXKcfUHB/UMt57t3Jpppq
         MzJGqZnuSMpBTKWX8YPwyS8vPC+5WYHLWgtKyy0LMP+9lqIVPN66xK7Qqgl5p24sCluZ
         eAcP7XZZLKcStw7/w+yb7h8LoTiKnqyE2qMk5QYXlREHS2TOqd/QGC9nZw/qDBAwoYFZ
         6bkusUNLydDr7ePTpruH0ftR3Qciv3zX/gyJZ0plFfaJIhUUGR926jzT9ewZwqcH3mmy
         7fyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUioxf/2wfsvhtoMYWIwiAo+f7inMVE3NrVjqusK5+RukZ5KQOt/kIbgO8jX486gMP2II0mdySIhFJpQG3yztgO@lists.infradead.org
X-Gm-Message-State: AOJu0YycV16AC+T7XRgM9JW6eRKEle3fnIt4wy5ABP8AL+IYMmDTQgEI
	I/YsWaBxCijBgPo94zMJ/3vXAMZgQmFkNwmpZe3UDY0YnzNgyqPK4KUiRPV0QCDcy2gpnFI6I31
	/rfjhr1LG7VkR2dudCQyLMH+0NEDQyYxwhRMtVhkLaMOtW1tLvIwKOOaDFn6gKDBz/Iw6LYAs5Q
	==
X-Gm-Gg: ASbGncsfUkwjfxN8zEM4q8BHheabqF1TbImFJ/0hyixO1pvVUYYBozKMJJ8wDisn3uU
	8mDCf/PNQ+8PwxuCexxewl7dDm0iLHHZa+iO3hwjkv/fmq7CUtWGYz9Ita5tyVy4ug7BQyVKwMy
	rzBlO+X4TYQmES92GoIWleeop4aU2on2c0/uGO4Dd14CV3gDhxjT5JQjRmzhGV6jKJKKHoiDG0u
	ciYFP8DdfIYuNUBt67KwLvB+xlBwc49Ua9dfjQXvnf7lLg3gBV8TV2N3AwRyWDybRHm1pl1PSbv
	Y7ebL/F+p++Ji+heVXmbw2hjjKQ1kLtLAAQ=
X-Received: by 2002:a05:6214:5f06:b0:6d8:a90b:1563 with SMTP id 6a1803df08f44-6dd2332ecfemr68470926d6.5.1734955228897;
        Mon, 23 Dec 2024 04:00:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE07MyBvqIKUXBpiZsouFYlc+nl1/rZ97d+byZH8jLrT56I5P2mnvuDGR3tDVnKH0tgCJCmCA==
X-Received: by 2002:a05:6214:5f06:b0:6d8:a90b:1563 with SMTP id 6a1803df08f44-6dd2332ecfemr68470616d6.5.1734955228521;
        Mon, 23 Dec 2024 04:00:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80665253dsm4826443a12.0.2024.12.23.04.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 04:00:27 -0800 (PST)
Message-ID: <e5dd4552-224f-45f7-b5f1-a6a5c695a268@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 13:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: Add CTCU and ETR nodes for
 SA8775p
To: Jie Gan <quic_jiegan@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20241210031545.3468561-1-quic_jiegan@quicinc.com>
 <20241210031545.3468561-6-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210031545.3468561-6-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: auFggL6wjsTAvewI20UYGuDXQYnc9BD0
X-Proofpoint-GUID: auFggL6wjsTAvewI20UYGuDXQYnc9BD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=760 spamscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_040033_059481_0611A577 
X-CRM114-Status: UNSURE (   8.86  )
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

On 10.12.2024 4:15 AM, Jie Gan wrote:
> Add CTCU and ETR nodes in DT to enable related functions.

subject:
arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes

with that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

