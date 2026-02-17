Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F7BE68174
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAB7LE2JysozOKo5lhqeqihEjyqZrs+8+jW+etQdq2E=; b=D50jFwef9A03naGpm6Dk3SG5a5
	CQkYJkKpg6fnmEj/4BjYxtQvL+0FvgLPFzOohXY5j1PwsleGgaZfmgb/ewEdDed1nRmXjZUhSl32/
	eJn+ly23gNfca3iDB1o2DYxAUs4wqDubx2sIYURbANMpnyLwkqErSbc+odIdpim3vyepujgcWlXTh
	ObzW/ROxx0EALBMN72iW5kasXwIn+yI4vGsc3Z4FMHP28eERTf33fjeXViIgr4XmeH17Tan0dWoMh
	XGQHPDiHTFKFUimesPpX2sWRPqax32qLVEum2L87fOG7WTeDscqB1fVva7C8gAG7wMhGdgcYi9/GU
	GMGK4jxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJWc-000000088yD-1jFH;
	Tue, 17 Feb 2026 11:45:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJWa-000000088xj-0Q5v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:45:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAkMaM597031
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DAB7LE2JysozOKo5lhqeqihE
	jyqZrs+8+jW+etQdq2E=; b=Z9YnCw7cMXTt+6ZKumFCX1KNbLo0bIbn5hdYt6pt
	XBS4X7J5SiIyaT9dRGcQC/604DHcCxJqOz0JSXoSi8IiM4ytv5i9EFckA6cUXnGM
	f6s1Fr3p6ANhPlgD7vm54Lc5RKhg/8cW6Pt+d2hglM8YAlilf+STHjRfnfFa6P2Y
	dTOphBSU7cuiCUIYTWOvHTJXfwMAJFTmr+1y/sNf5VfylYqCTIL0uasJs7y1b1hA
	ze34jV/VvLA/PvJt569wuis4B5SQyh7WWxUDcigWodrF1sZcZJQKkoET9HGoctj6
	EnP1kJ9avAn4LRDDXE0rrm7sKu9Yw5G7FXEjP6YswvJV0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361na5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:45:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so2936917785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771328750; x=1771933550; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAB7LE2JysozOKo5lhqeqihEjyqZrs+8+jW+etQdq2E=;
        b=jf8uP6vsDD0tsLeRTBMkwIp/+bNA8stCTSCcF8QTihf8UcMX2kqTO0ExESK/bheoW+
         EUpFm12X/6XIe4dbcsq/y/W81oApC4KejBpv2BIYe1VSNWawNIBz0NejFHPo1qCiPjO5
         l3RQlRO5NwOtLSogXs27kMV81TJPui1TIH0okL4VUk6rYYQdiTumoNrvom7M5SwhC76k
         4UfJvAtFoXccZDCD0BatRSBcK8jDhxJcyp55EPP1wRym9S0HVCO/N1LFM5KJRmkXLMJx
         4CnIudwzEvzoz6VbQl1c9Dogk5YupUbJ2MSZ/ckXI/ruk+65SQQL05uhVB3Zfgs0kGvI
         yM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771328750; x=1771933550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAB7LE2JysozOKo5lhqeqihEjyqZrs+8+jW+etQdq2E=;
        b=Ra7RM4zgZFHW82dGbqBmJ3wfKZf43vNcKsXFjFxD8+kl2obWfHacL0tHWYODhrZR3z
         jwmzEMc17yEggNPx3zReMV1L9W1g3BbVy6tCUF8mYXZIKPwtnQ3N4zrIiKymTeli80fo
         H+lJMA3EzQDo2hLsainQZ1WzAJhK1iR3Y80QYuIm5YCxD51nzNqGy23C5hgx+KEb21+R
         E0+FpaFHgTKCtanmeioHj4sj4nM6XmUAvXmd66YvFkFkAxaCNowH3UIV5AlCJe+tOXQa
         wvYQVDgH/dhTN1C98CutG/ocv37CzkJXP1eAWD+gc6Ore5v5JxionSEUP/0TKOcPhQWb
         ZGig==
X-Forwarded-Encrypted: i=1; AJvYcCWO7xLK0sDFuu5rvAKknUL7/0syBL92D1BIyp/SfvjP9KBVo89YSG2r9YpkaQXS/tqCnJgmXnU63kW/1vkN+O5i@lists.infradead.org
X-Gm-Message-State: AOJu0YzSA2HIYdjcwhwlEf23BtC+n79hLd1FqcnJvqPDIyeMs2RxfxSU
	W552MOGLBJPKEQLFRfWszxstcqUM8bOrt9jBjCXztFeuZRHdX0LLdrQXKiEVClSzM3yP5dmpqRc
	p+3hh9BdWg1sR9KtSp0ZQ5leJBaK4KXxUnaM340smPfIocbM4pytRaIPV86nBirFs03T1bLBurM
	0yaQ==
X-Gm-Gg: AZuq6aJAKB88t0TKVTrpTrtdtTmdEEM9gvlXoH8KASdnBUAM2k8s6rqTKD+ICczMIJN
	xJB50jVimLCy440KBjSt6NaE4LLJ027ydhpC0gjp3VO6/gJurHohPKGgA9m5SMsmm3ev9gm8AKY
	qv3Fu5rT3qYBcH6UF18Em+YbQAeZx+mxqT/g1520bdCsC5a0ZiFmMTqmSsTIPk602j0kAEwkUbP
	Dfotzq8e+KQ46Q5jolOl8G1zA3WmWCRZuqwykekMiEN1KYex5Wv3/tolwGZnq63K+uMOhH+w0UI
	jKwX3fVOtKl4ysWv7U6VZM2YohWELQ1HH4ABg7j/pZdEuIzU9lp4tluRKZG78q8A1l2Q6cQZvV8
	9RAfp1aGijJcvLmrSvyhg4JXcNsHyztV4TUlN
X-Received: by 2002:a05:620a:370c:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8cb4ac9e4f6mr1413711185a.39.1771328750365;
        Tue, 17 Feb 2026 03:45:50 -0800 (PST)
X-Received: by 2002:a05:620a:370c:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8cb4ac9e4f6mr1413709285a.39.1771328749853;
        Tue, 17 Feb 2026 03:45:49 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483740be167sm306562045e9.15.2026.02.17.03.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:45:49 -0800 (PST)
Date: Tue, 17 Feb 2026 13:45:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750: enable ETR and CTCU
 devices
Message-ID: <z7oat7z6qpcjjdjqevqny6mebjzrt642vnwpv2l5t5vlwjfseg@t5alz6mpptmf>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <20260204-enable-ctcu-and-etr-v3-3-0bb95c590ae1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-3-0bb95c590ae1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NyBTYWx0ZWRfXy1e4mUBSK0l4
 ki27dXOrjj1MoL8URxdf6qsoepzQoqTpyqDm064Uf79Imchos7K6gfvKdKmv4TI+ZBzjgp10LIz
 MOI0jBrPx9grvl51/x5ydc9wUxKq9AFklswJiaitLJKs5Y5QW0PG5RBxheAQ8U0tMq843M8NyQP
 eEyZb2cykIItLkH6+5diRPthVFyMXL5Sa7NSQCG3kt8oHeCyCYjlgo1W+a/Jpcq6bBEESYEj8Et
 ja3gV5p6xWgoF/DR/+DZxWHd0tVRv4Ym/ZvqDqznz6uR3Y+dkf6A6bKoGdkxZ2bOYmppF7bVq2q
 w4D8mK1W/HegWKVwzwBE7LFIu1IZ7SQ9srvS/bdrCqwFz4SRoT5ibd1wf66DQ2cc0PNyTVBgJY3
 ETLSfST0pfN2rFymPDJnkonLOrySJ9mjwXuxDLEX5zHdvNNEt+euf1FYOus+Ql6aDxvBq2kRZLq
 NM0kcwoT9d1/73UDzhw==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=699454ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: AOtuz648d-pz47qMm8CDoUZXsAjTcM63
X-Proofpoint-ORIG-GUID: AOtuz648d-pz47qMm8CDoUZXsAjTcM63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_034552_145213_8FFA938C 
X-CRM114-Status: GOOD (  11.78  )
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

On 26-02-04 10:22:03, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

