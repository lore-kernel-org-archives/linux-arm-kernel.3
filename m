Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1416C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWPI8IBrH7hlnkBmEO8Qt52b2JZ2LdgusDzm/ZmxwCM=; b=2kWcb3pRL2fHkRQAvwTySiiVzS
	V6/GcLWKyDkybvv4MG1N5r0ml8ueXmMPBE4SWEfvdpzcQePkoycOJ7RBTSA2t7KWwXzCVujipx6AU
	f7vUv8GF9wxfiJZNw8A5K0c/VY/2Yhy3nFXZpVMEfsjnOmv6edicwrjrXbWikPH9k8LRm+Ssyubw6
	mT9JuIuZpSJegTrLb9XaiGI6Ydpf1J8L7HT6npdG1ZwcFm6nPbie+jtmut1FeB9jE41xROl4Znc0B
	sO6nP4BkAiCUowVHqiYLSaw5flmp7y3UpVtXxoCfTZxzjHWpTA5q3PTUkqubpM5kgLC6kjkm61lcm
	xz8xapeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9k3F-00000009e0M-2WhA;
	Tue, 29 Apr 2025 12:27:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9k08-00000009dRJ-0gei
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:23:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA73VW011798
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 12:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mWPI8IBrH7hlnkBmEO8Qt52b
	2JZ2LdgusDzm/ZmxwCM=; b=Jepv/vp+wV4PAFttjELu8cAbXFsPwIV29w+Gx0Eg
	6S+1lTWzJKVUDMIkSbq6iFufXGAxdwdKKH0zRx4sHPHG6oUGySHVy768YCLlOjP2
	rtNOBox+emSg593ZEVQzvX63vlYUoH2ss/j6MlyHNXdUgFAAXIFLffIxRHsue1Fd
	xXRd9NnBe+c9Cjbzjru6lrF677kA5dn2oj5SFr40nVn+fruysjAKcfM4fSLqnKut
	K9tqjhzUxj1ml3GGZ/rTteRcjB5eTMK0W5yu4qKSsWJfuQmfCicudCMvJvnxqN1b
	GNqm4yJshWEACANApoM2uKrrekgVxI4/0RGTkjSDab5XWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9chv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 12:23:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c8f8ab79so924287185a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 05:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929430; x=1746534230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWPI8IBrH7hlnkBmEO8Qt52b2JZ2LdgusDzm/ZmxwCM=;
        b=bhYzJ9ymJCwoZjE6gu4E/+V8k9WNDmWuUDh6b+reHJP+Ockqystmv+t/3IcngZYN89
         Y2Clk8TCpT2JKjVxzCBETaWegYXbKF74XFVyLrXv2Xmw7GCPrtLy4n/fKsf08K89ot7B
         awmEzVq92K6J9uT0pYCLqLyFzs3xdlSG/79mlDdG3tHt7wczchP6xYPNa6PXoVl+zlD4
         C6mzCj0J+nfKtxtlqKW6ot8ebYbFT53jt2Eb00XtfALscpivU1RM17W6AbmiyPLjl21Z
         cvsfEcRxG+1VKxiWSxsqmzrMOjURCIV1QTZz2Uhc2d+DB0ZdkGgaH8oavdpU1GzuikPQ
         xYNA==
X-Forwarded-Encrypted: i=1; AJvYcCV9owr1WQDyOHtuIv1HnSo8gn5xKuSBaHN5vdy0inb/jGC1H3T83MaflXHLxRXvSuMUYIBsFK7uR/l3t1UKy6Uc@lists.infradead.org
X-Gm-Message-State: AOJu0YySyPH72H33rS0/baFRi8dHflieyr0bM+aJoD7HZfyclx7NBXYb
	Erc0qDPyL/56sDydpQ1O5U01anq9SD0DaC9sGyw967QsKrOrpZZleTE9KITmN+6tcGabaG7F5Sh
	82HH3cfsH2dnH4aH4CGhwkCTwqaafbk/gHVG1MbqF/LKVBm9KuG49tE4JGL3X0N061EDPG+e5pg
	==
X-Gm-Gg: ASbGnctP7xz16BKTTZkpnrtlIjGHH8JmYVZIMUpPoRu0V7vG0he2FkD87faxG5nNEIu
	q3baXI38zyMLyKexn3kWYHv7wO+a1fmwOrdhDt9nYadSkrdvU4/mmDvWlxo2GLeRKerlLuuQxRb
	qFVcGuQb705iwncrbMVuegQeH131bGpJrnkRYcKx8WMY/ogQvmcXf6hZndONxolw3StlCo/G01g
	0R5UrTqZIIMBpHC3AWr48p+4uXx8g3NisNSQ9z0J5tPXikoKYogAXXi1eMIhTqy8jFBXciGtGe2
	Dx0ca2nQqVU3rUtn3zIBlGDQnD4DJ3Z4ppLElIc5blOPg0QryHTxaR09RoNyIdI3sKGrK0PYKLk
	=
X-Received: by 2002:a05:620a:6117:b0:7ca:c5bb:3007 with SMTP id af79cd13be357-7cac5bb32b5mr25637385a.37.1745929430404;
        Tue, 29 Apr 2025 05:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/YVYTF7AsqT0sUlkNbluJNYqiS/QEjcLK0UlrF+CJVw0ltMIa46t+oqSpGCfKt2bt7Fmb9w==
X-Received: by 2002:a05:620a:6117:b0:7ca:c5bb:3007 with SMTP id af79cd13be357-7cac5bb32b5mr25634585a.37.1745929430043;
        Tue, 29 Apr 2025 05:23:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb49872sm24408651fa.35.2025.04.29.05.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:23:49 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:23:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
Message-ID: <igei6wspjs7qetjx7nrhr42kbvb25yaldpfx32hyrjalajmcfg@qcshsrzwejxe>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
 <20250428-prudent-hasty-pheasant-aecec4@kuoka>
 <29d15e93-8f5e-4cec-97b8-8592beb01d6a@kernel.org>
 <CAO9ioeUo_vO+-wuC4JGi4JfSMZx+JZkvLvsi=ppBD_LvuV2ZLA@mail.gmail.com>
 <676324e0-43a7-4227-8b6f-3fec97a484b0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <676324e0-43a7-4227-8b6f-3fec97a484b0@kernel.org>
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=6810c4d7 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CcgAk7be1liTUAj5SvwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: j5cFIWo-5nC3uBqtHqT_kPOe3n6XqDdb
X-Proofpoint-GUID: j5cFIWo-5nC3uBqtHqT_kPOe3n6XqDdb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MiBTYWx0ZWRfX2y2wI9MUHK0c 4jCVtbtlkzXsfxbyyJ1DVqQSn3PR9Gya8PjiW/eBKHwbUulvChG4HMHu/5ADV13HG5/cNVyj7gw eatMYAMBXLxaR5W74xqst5inSry/8qjedTub8H0NN4tSywjX9N9hRdzB3zcdpQqRcQuxsfPcUQC
 mawS7r8exK8zYK65wXZjliUaD/q72qdii6yOI+wCkScBKixeEjWMafrQoawqTCvUOy+L2yavZR9 j3o4fsJK2COZDYyms4aMrz7QVy8r4BM5vmXJBWt/aQJPBoWgQViYExAoRTZIpjn4hhsZ+1aUTal 13r3YxmK6XSkhFr7AhP3CutHWEOcAjpWHAApFcxeUzKFxMeC/j0GrI8J+TiENbXSg3C6szmUtZX
 G49zRb2WIyK/WZz35CPW0F1iiE50uOQdDMHw1n2YmnnQvSyN/6RHzF7o5ZIHmim8uc7gusVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_052352_323905_45B3C6A7 
X-CRM114-Status: GOOD (  26.74  )
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

On Mon, Apr 28, 2025 at 07:50:04PM +0200, Krzysztof Kozlowski wrote:
> On 28/04/2025 12:49, Dmitry Baryshkov wrote:
> > On Mon, 28 Apr 2025 at 10:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 28/04/2025 09:07, Krzysztof Kozlowski wrote:
> >>> On Fri, Apr 25, 2025 at 08:47:01PM GMT, Dmitry Baryshkov wrote:
> >>>> For some reason Lee has mis-squashed two commits, picking up one chunk
> >>>> from the first patch and one chunk from the second one. Rather than
> >>>> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
> >>>> Add qcom,apq8064-mmss-sfpb").
> >>>
> >>> I don't understand: that commit looks like direct, proper result for
> >>> https://lore.kernel.org/all/20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com/
> >>> so where is squashing two commits? The diff markers have offset by few
> >>> lines, but it's still just few lines and they do not matter - there is
> >>> no diff/patch mismatch from that point of view.
> >>
> >> Ah, difference in compatibles. I see the error. Anyway, I don't think
> >> revert is correct. Just add missing compatibles.
> > 
> > Why? The commit that went in is invalid, didn't come from my patches
> > and was produced in some weird way.
> And revert is pointless if you immediately add the same changes. Just
> make the changes.
> 
> When we see a bug, we do not revert the feature and then re-add that
> feature corrected.

That depends. If the original patch went really bad, we sometimes revert
it and add a clear implementation rather than just trying to fix the
damaged state.

> 
> Instead we correct the feature.
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

