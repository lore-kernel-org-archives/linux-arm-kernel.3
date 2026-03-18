Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0713103E17F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4obHx+u6g9OIVr0W69Wxv02v/gbopfLolpa7DVkHWQA=; b=v6d+a5FAr9SWVx6G5bA4k5jh9X
	P5QqGR5lDv8DrPbS1GiEGeJ/x6rq8cCOdaGThG1o6YMF2QNby2MGFs5PXGYJKrqJx0k0Oyn8QYQ6G
	dGWOM0PieL+o+c9p9+1fHaXYkspwISc3IPsmoG96ns3UL7Xt0fEpSrbYXreU/SNLQMJaqK7Su1ala
	EuRy1gBk6pUucIY9ksJ/3cIHFwjzneI+sVxlW08FVnJxQpjL7+gLGnIdPvHbzE4cbTm2phdyganlR
	fF0MNqQ38LAkn5OvC/nIWmEnqoLen1XB8KiBLlwgf8l5vaYnE+rClOzk8lLXu7N9CKmACLM2MkK1d
	pzobCu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rGQ-00000008WEI-39bS;
	Wed, 18 Mar 2026 13:48:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rGP-00000008WDo-06zI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:48:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IDUDmT2789492
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4obHx+u6g9OIVr0W69Wxv02v
	/gbopfLolpa7DVkHWQA=; b=HBByCaYNLq2865gIvru4VJjWIJhjEmPeRFhpRIqZ
	7R2qcqEgpEb1oQOtNQ4jMsGe3jb9cfwJKUCK7CHB53dbsD93l2hIw08dAwbLStMO
	MDwYr8jryl2QxO7B7hVxWPe901xVoXUHQQa5xK1O33STPzxIFW342YRhdl3EIamC
	SwTkko9sdmfVSXfmORfPToOEd1ryQWSXym3MMYKNka7abHVDgydx3prlqTVHjJqD
	AjF40NRWhGPGbTaVczkHqZ/e5r8rjx0cy+FLmOZbZF8A6XDTrHTLkXiSFVsrcNrn
	P32NNuh1WA80mjGO4+HGnN2KFpkjHX7864Zz1MVCD+PJbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g2ryv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:48:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091f12ed3bso78445921cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841723; x=1774446523; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4obHx+u6g9OIVr0W69Wxv02v/gbopfLolpa7DVkHWQA=;
        b=d30MaXpRnGVp6rTbz6UOCRXwRxWdCwLJRnWlsRm6sZUME0zTdLTCqcQa3c6aZeB6fB
         h4SY/ch6fw6zo3P8aUykwurWA3gyikCSdJQfAhUeMrAVjC3CPf4hS5O+mjNP37H9QP3A
         jKtCrT7vU2bGsewwuPVToik0QVBzVPrQL3sZHk3bsQWfb6ZBo10ymp+eCQaMb/S1AkPx
         aO3GPjlZmeie1C3L7AwparwcxptcLh+XC9CoIEddUfUHxlYxMvSzvR4jBNKIe1aTYCGz
         9me1PmUW4edPuvpaawHB52t1cjLsFTfgLhxfFegTsgssaxpDCScWiy35QuX574lxOng6
         rZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841723; x=1774446523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4obHx+u6g9OIVr0W69Wxv02v/gbopfLolpa7DVkHWQA=;
        b=skw5Y/9jAOC5sljBb4DWhZBQK5Tu+Q0bCq8cJTvyrrQjy6mLFtu9et1VfKwhqwg0OL
         qcM3QcJ68/3TRnvgivnLcJw3KEO4XnsEz+CaPrPt47vAX7/zuMnKkZLcZkMknfLd+sXK
         r18qjxWdzWXKf+lOHlq5ebgnAbg0StlmqevlgBkTwco2i1jEXZSd2LmYHxNxZkON72DI
         g2/Za2z/W2xL9fi6X2zDcKL9VH8BY+O4dEdtdOLSlSEG+1YRzkE2wEZvqFiaq+kOfdtF
         9pAr0E19CDyUXLfNqq3ycmo70oL2Yhkexy8LhQyFrSSqgZ/op8VMvO2b+mfqL43fqm5L
         s+2A==
X-Forwarded-Encrypted: i=1; AJvYcCXMksIWDLKJpfB7B48/YyT2R+8P+llJ1hMXmDAwHOyPVnn1VMnWm5AfSTOmGOgAzH2sLQD5SqhjCtO6tNJ/BPZr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyq2BfF/k/sPo5cYxUSU3NYcwoORBhYX8CoSAV57H/Gp6y8fDz
	fpqVKZuZCeSk/TKXZXjGnL2e8ErQNhlcgI6Ew1ysIeiTnBu/QNmSIeqbd3+fgscY0Ka8Q7pWMDq
	ybdYuo8yZpMDv+FuAdoehai4Uxb/I2WvjMcRQiP3UJJ74jLa2+SByxKFqLYW9T0U4Mjfj25O0Dc
	QCtQ==
X-Gm-Gg: ATEYQzwNZUCCnvNsprBcPZAPvMLLXo6MzqhEEkIFp4cEO1nOLIKG/GzX8qvcA/U8ee9
	WVJaK6FuQkTTTiWNgjAq3VOER0FsjoNVGSvhd4WKJQR6i7r9SiZguFp+kW1nicAKb7vRuO2Qv5a
	PJ8C3sqUOZw3CmF+9sGl3eRCjJJmK0Qs2p1KYOqUEw4P5+okvNh42LuSnsd9oQZ71tq7Py1HHwl
	ZRMRVbmLgBDQ8QoeLGwNWmNkmtoRFKksxTLpGGcsMieQj4Lq26MDPIVmY5q2QnJjfghQ2twxm2K
	vxxPLBHwV7VvmdGQ/8SksZ9LjcX7cL8z4I3VoymyZ0+YR8mmYqcPF7roS0bbJ2S1ow4e5ZBnRJo
	aYs63ZrFJGsTBuVcmrFWcz+gmmeyqSY318LT0+zk5TwAHBqUlNH0RT3ac4ivqyzuIU348SH8JC3
	faqnMOsoDFvS8Qfp+Mohgzzlia5iGpuxrZUlw=
X-Received: by 2002:a05:622a:44d:b0:509:20de:4acc with SMTP id d75a77b69052e-50b14880cb0mr44388381cf.47.1773841723376;
        Wed, 18 Mar 2026 06:48:43 -0700 (PDT)
X-Received: by 2002:a05:622a:44d:b0:509:20de:4acc with SMTP id d75a77b69052e-50b14880cb0mr44387921cf.47.1773841722849;
        Wed, 18 Mar 2026 06:48:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5156e74sm6353381fa.7.2026.03.18.06.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:48:41 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:48:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: qcom: Cleanup redundant header includes
Message-ID: <7u2esescnuncs5rvzpjnggxhwizbodwcmhcyw635bgelg6xpsx@n4m5vtwuwuwl>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69baad3c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=aywfhrhUYFgYpfM73PUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: eu5KfSQvJjqT0fXT1mjfwBM9I51no_GS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfXwoCqgleABdEu
 sNex+DET4q7tTHbrg0YH4UTHV/epheYam5Z5GEx8BAN73L5Blgx9YLZ06PNUx5LQ9n4OCtiweEd
 7F8yhzEXwmEAGnAefF0iPmpax8mKlW7UUDAHogYp8fHFRvoG+UQIr269dS9D4/jJQmGZtqaqrHN
 Ss8gCoERxlbb/0y3csNNHG9+a6RviekJqeD2bBGwwwLDHx5vb68up9GLA47eeoKl66c4m/0xpbO
 gjEhYXDXKxgEu3qxWIVhsLTm35jAjmhaZ+5dh3xQuL3+I7oGR9C373dUY4x2eyJMXfYHT/VFvQu
 K7SeFgWuaHk3KhpYtZ54pkucq0sbbw7wF8P7U6rDw7dJzp0HhzjieIa/FXNJ7XmF3rVnkLWuAOT
 +HYVmi+1Qo7DkLQWoHy4Eba6TjLFrIwgHSWhHGG3zc2myfu/Xyfcny8A/Aanz3I3ms34mEzXpF+
 XuTnkYOCIy2Et36ybrA==
X-Proofpoint-GUID: eu5KfSQvJjqT0fXT1mjfwBM9I51no_GS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_064845_069987_0631CC78 
X-CRM114-Status: GOOD (  12.78  )
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

On Wed, Mar 18, 2026 at 12:08:39PM +0100, Krzysztof Kozlowski wrote:
> Newly introduced drivers keep repeating same patterns from clock
> generation scripts...
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       clk: qcom: kaanapali: Cleanup redundant header includes
>       clk: qcom: glymur: Cleanup redundant header includes
>       clk: qcom: sm8750: Cleanup redundant header includes
>       clk: qcom: milos: Cleanup redundant header includes
>       clk: qcom: eliza: Cleanup redundant header includes
> 

For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

