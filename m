Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E781DD29FAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 18:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhlnwTUuu94mYE5+7gwV/b1e4+P4DIXzG48bpME6e84=; b=Q0W0k4r01Odr+oUkxQzEarwvK/
	tYfHemL1M+KRmTWnhdVUjsdbQe+4qb/ccIvva4vth9MCYdFdirq6gkQGsbHm/EYXdOq8GFbVlCxrv
	0pDnRCZbQdXMCPP8/1r0SshyOeZzgf7yaIauv4w68f81hpYQtGhtavXVk4k9wqY7Ys8IEQR+op7k7
	84RWH5rK6pFEK6v+hbR7ePdbdqJCAbAm4WuYBdpdMfFgqWAwIXnokBiqcUGyG0Nxds9QYPvzk3al6
	iVZ43TU8SqfaqC3ENVCbKr1QkDVlge8sYWLLClZNDJO+ZLyX2eGCRY08pIb6FtI9cLUPiY4HTJB9q
	hEYxkypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRE1R-00000008RVh-2jCN;
	Thu, 04 Dec 2025 18:25:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRE1P-00000008RVB-32KO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 18:25:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4E1dFp1566871
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 18:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IhlnwTUuu94mYE5+7gwV/b1e4+P4DIXzG48bpME6e84=; b=dEwyNu6TfJKZIWmZ
	Dkg2OteskjpjAd0AcRwZ1j1TmSdP2h95zStnJSTJka3ZZVa7AyBgQ+luS/HYv96u
	SHrswjC8yskQTUhh1kVhLnEwtfyyFzuDthnu3CO8cJZja6UDZXGba2ojgHkTcoSJ
	fy3CuIxjSWou6MXZr2TexSFr+bxqkyGoaYX/xjCapXmTtqoQIKU+4Ezz9ZxXPCBN
	aiPyfVRKeRcDiBZR7jtcnEOWgSBDlwLt5xEEjjvmC2C1503wKO1z8g3y7OpRd1dR
	I/6GbgHJ6sjds0p1LMWlAx1Xd3ZACo37Vtfg+opLIDlp2OzjiguWR4lm5p1HCZCg
	Jj2McA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aubpx0urc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 18:25:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2657cfcdaso166975685a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 10:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764872739; x=1765477539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhlnwTUuu94mYE5+7gwV/b1e4+P4DIXzG48bpME6e84=;
        b=JAkyq4wFdd3k2jO0jPn4unynFcPuZqSxJSOqlH8Y0rgElVwzPzjErjdW+uh3G2PL+m
         f2EifJRJUsqtWVznG12yvxyXr0UYLKrXOymbcxXBU6mWlgwdCKhZPj7xcdhnMk8//k9B
         kd1hVWe1aB4Ma8xzRHgz/btrn2KPDRNZFJ9EV+jWiZ1bahAngXfB8KCnHY9KOCqHR+XW
         rV8WFjxNfIzoykE7FyO/OiBegAFZUuV55dnP4AaQmWp3xEbQjXAr3/tuwx+0VDpUCBtl
         IO9AICWlLb1v5edTTvTsH48PVJvt5yTOW0CRv3pWxQekp4ji7lvRLSb4uOBrd00QtWeY
         Qonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764872739; x=1765477539;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhlnwTUuu94mYE5+7gwV/b1e4+P4DIXzG48bpME6e84=;
        b=ZDd9vRS95SDKb3qxpS0s87vRMtysdSqqAxn0XaQeWSFGy1KFKdGC00h2YajgSCpQJd
         n6j0XezUdzXuJ7EC53Y4eYRwk+9MQh8MedOWO/XfSCGk7y8w6+CNOrFi90aF3b+I7Ji3
         AMsoG9iSVCma5N4qLTLcvkWhfJR3z1nPeu+0Yjy2vDA5tcIi9Zv2OR1HYYfl6j6j/oxK
         2acPti5EBxdOHs6s/3YrYQKtCn7HAe3Qfk7kP/4UU3LIgb6/oM6eM1fRiTM+YCKDrejH
         syhe8eZRzbfwHG8n6Vs7QveiT4DU1t07IwWcElZBMfwb9hmeVR/l1htd0PRA45nnI9kg
         7CTw==
X-Forwarded-Encrypted: i=1; AJvYcCXYiVUwWb60sdSPWZf2Tu47u7Pwj8Sc6ECPKh/oRvRJ9Qn/xunKboozsZ33TNELWSw3jP8VxDtOZiDWaU2TROdo@lists.infradead.org
X-Gm-Message-State: AOJu0YwrsHtufYb+ZwjQPVjmPjMmaQndHkZBuYJQzjmStbzbTrzALhh8
	K14uuEqnyxec8s92xe7XoDtE7gkjzd+4X7z/mYBOfy368PGCx5QDljFKWfBCwd7lUDv0+c/KIYe
	kSRYunEGTz4DkwGNmh+wqAAdMFwmdq3wE4kCtXMJjWo5FnsyiuPv3K140zagABqBpmz1HjNROoX
	4yV7XnvN+4Jg==
X-Gm-Gg: ASbGncsLPD+A+4CU+eQ1h3DdquyXDbkUsEmQV4KebrTiQxdEJ6ALn68uC3pLbMXw2FK
	XPX4I+LlAwnXzrIy2QMcAtqltY9Q6QxkAaDEXprWaeYG5H3gBLMdmF+hfbqJtF+2/oKVXIS5Eq1
	IDOYKcpPz62lMZqu2MkTM1lWKuQYzddozNa0s1ln+r/ah1Vbqvu3+0L8Bxx7xhmNoLoCYWQNx0x
	l8Kwd5AL789qOowrbTrCt6DY2llQ7pgBO9ouD5d2Ec8JYr66UfHbGg7Jv5H4sw1in5Py6LpsuK5
	UEbM3k4s/16VY2YDgAVvWxWGViGqOlHxtvgttJ/KJVc9wBw0uoaSU3EO1B438/lPRKUHnRk0qkM
	DSTUoFBrlShppXpE3BnV1k5aW
X-Received: by 2002:a05:620a:3720:b0:8b2:a4ec:6f5 with SMTP id af79cd13be357-8b61817302dmr505912785a.11.1764872739036;
        Thu, 04 Dec 2025 10:25:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5aWqiaetsamvKNgp+D6pbKGjz3C7s4SQA1ECEYT8J6MJtch66K/7k9GTaanXbvz9dZojKMA==
X-Received: by 2002:a05:620a:3720:b0:8b2:a4ec:6f5 with SMTP id af79cd13be357-8b61817302dmr505909585a.11.1764872738552;
        Thu, 04 Dec 2025 10:25:38 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d222506sm5214118f8f.28.2025.12.04.10.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:25:38 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
        Cristian Marussi
 <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
In-Reply-To: <20251203-super-kagu-of-amplitude-fef078@sudeepholla> (Sudeep
	Holla's message of "Wed, 3 Dec 2025 15:21:31 +0000")
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<87wm44aect.fsf@stealth>
	<20251126-camouflaged-delightful-cuckoo-ddeac8@sudeepholla>
	<877bv3n7x2.fsf@stealth>
	<20251203-super-kagu-of-amplitude-fef078@sudeepholla>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Thu, 04 Dec 2025 18:25:37 +0000
Message-ID: <87h5u6ksta.fsf@stealth>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Odhbdc1yekbCbLJifZwTZSf7nvzylTHl
X-Authority-Analysis: v=2.4 cv=H7LWAuYi c=1 sm=1 tr=0 ts=6931d224 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7CQSdrXTAAAA:8 a=0Dndub6nNIkmeintA3sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Odhbdc1yekbCbLJifZwTZSf7nvzylTHl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDE1MCBTYWx0ZWRfXwlmQUb/NSHrE
 ueuhdfKGYdwQtVuwlwduvfG1vliZpLhha9YgrYdQwrSmGV6CRVT6g10S4PCrZbb60HanryCM+0k
 s/DZpNsy6MTh5eRXMhqN0zRKgpwMC+Qkyx3mzdbtdrNxPkSH3f6ad/OrVXBetlIm+6z/cHELDFs
 6+fOWCI7wRSLj+VWpyy/yPiEgwd40QUmC4CdHfDOh0TunxFeRjfni+aT5UsOCuzHrj11pdBARY7
 y3c3ra7i3uJbeWJDbJSr8NB1aUV9/2s0YFc1uTr4q+for6fTCkmYa6k/rXpX6y2aEtHtwxOJH1v
 szidnM51eSn1WCdNIAEWH26/NJ4sng00BKlHf9Hnu+iSiEm1hLxL8ciaGm7r/mlxOjHFPgdJxFg
 GZIgjUa5n/qBBSPaP86MjiTQfnIPUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_102543_891583_4FEA9B5A 
X-CRM114-Status: GOOD (  19.73  )
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

Sudeep Holla <sudeep.holla@arm.com> writes:

> On Wed, Dec 03, 2025 at 11:04:09AM +0000, Punit Agrawal wrote:
>> Hi Sudeep,
>>=20
>> Sudeep Holla <sudeep.holla@arm.com> writes:
>>=20
>> > I can create one but that is not strictly necessary. As mentioned in t=
he
>> > cover letter, the only dependency is on value of SCMI_PROTOCOL_TELEMET=
RY
>> > ins `scmi_std_protocol` enumeration. Just add one and you must be able=
 to
>> > compile the series independent of Cristian series.
>>=20
>> Thanks, I managed to get the patches building. Looking forward to the
>> series progressing. If possible, do keep me in the loop for future
>> updates.
>
> Sure - I=E2=80=99ll try to remember to copy you on the next updates. I do=
n=E2=80=99t have any
> immediate plans, though, unless the spec moves into beta, changes come up=
, or
> someone specifically requests important updates that would help them make
> progress.
>
> Do you have immediate plans to use this on a platform ? Or you are review=
ing
> just out of interest/curiosity =F0=9F=98=89 ?

Ah right - although I'd read it in the cover letter it slipped my mind.

I am hoping to migrate some prototype code on top of your patches. Only
worry is if there are big changes planned in your patches. I should be
able to use the posted version for now.

