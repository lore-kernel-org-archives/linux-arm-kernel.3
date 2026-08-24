Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC04C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBcF3v6N3cNbIQQxRfkuaUX8wTPsyQxH9smMZXqQRa0=; b=VEpXDKEQKddEAhdNhnkil7kmJW
	SNVrfALeKdrccIa80PWRm7LyYIGA77YgZoN9RfuGHnjTbQcwc/v8/oCdxss1dfc4R2eWV+E4cdV4n
	rnk1rCFoqTzUjFm/zlaZLZ2EsJbhlL+euGyIyx39bfWqne422KV6sVbQskS98nNVj7PQXxuSFXAYY
	ABZf4TJhhgqp4WvgioCu3Vr1v/fw8QHRBDDpFGmC+dJ7KE5iZ1lecdx8j7bSSa1wuROq/vhxgJwzZ
	VJJErrWCreORBAv3TzpvWxew/DsbyXXGNfWfX7pSSSBJNxUR9sPRludTj6oiZQFs026FzUzw1XbuJ
	G41Jc7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyStU-0000000GVwI-0PEc;
	Mon, 24 Aug 2026 11:31:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyStK-0000000GVtQ-3oz3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:31:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMfXT2648212
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KBcF3v6N3cNbIQQxRfkuaUX8
	wTPsyQxH9smMZXqQRa0=; b=OYWLqoEGssz/m7iECFiWlIXeP5MbL9O/UejApR1w
	xkuHm5qt2yguK+ma5PwMbB5gQn2Na0/jsaMALOqEHLLSsuO3z3bQKPBYqVeFF+Nd
	Bva8oKE0xEH6isPQLEj/qY4deya/3kjz+zfvsisWN6D9TY4zwXotyefg+fZesCDN
	eD9Xhp4fEzOdAoqcVcbtMLSeMor0SEzkjTW5dpY6jO8Z2ENGkwu7x+58A2qnFBrX
	VL2Z1gJ5DOKUkPT8L7HmedI4LTJIDTATi8cmynVdeb+jYKD4TO/r0Wo8rGY1ZNWi
	XbNcX2dFtgYYZ9nxzOCOKluw29VW7DAskIGP96Zz1lQpBw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn97t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:31:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso48018931cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787571061; x=1788175861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KBcF3v6N3cNbIQQxRfkuaUX8wTPsyQxH9smMZXqQRa0=;
        b=RXkuIXJt2gYtwM0UhBB7NPJVZmXonpyFhnm0y4L+kPvGdGAYyEIF83w07JMOJYNmd6
         gRJ40RPTANAh8M0BP6U1gK0MTUQqLcWUjSzTfmnoXn9HttN48+kn01TC+0k5AK+11WNC
         dK4ES4hO08YoaSJRpbYErS2mius0zBJVnwg7zreQcidFvlv+fDa578hu0SAIvbZt1OxI
         PLqAfPADxkVx2s4gRWVjLYf9hBHiPOpuMV5Yuobm4Lid8gUxLWGn/7sXn3ABDfHmk1yM
         V/mDBpNvkZSoBvbBjyvnwV/QHTHEHjeCeZp4KhuFcvLzGaW+GWLOkAC/gvf9DfpzbqXM
         DcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571061; x=1788175861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBcF3v6N3cNbIQQxRfkuaUX8wTPsyQxH9smMZXqQRa0=;
        b=IcCU+iclVFR9IqK1zxSol2Ri4IdZYFKElRwMPFdQ9ZxSzM/TlUaNN25vOy0B6unCEf
         SiMU4CGBB3lVuF840ikFqBy4jCLHsxk9y3fJPyMPYc8t9Z8l2Uhp5zUy1iRfynx7iiRx
         XDiElBhCtgtHsW5mn5uh7JbJufK5bjRg9lg3AkEQGDeNtk21m3R/CpP42FiovUxC3HYs
         CBzBy9vtLXvDwEarnBkUAEqK2HuK/N0yUZjhvrMtWX+XTSImQFuuO29M0yAGmYPPhUa7
         JYw/UdLP7f0E3HJj5oI9rxGM9LnvgCsH4qIKqKccQ5EbHoY5O34y6fXg0xwkObDZ/KBO
         qqlg==
X-Forwarded-Encrypted: i=1; AHgh+Roiesg+0p74FQO49P9mY+bdRHmeuZ5Tu3h6Mzh/D4ASRi1QVc1gjrP8gGW18w+sOSKzOdenS1aRWtKMDiDsKQ8d@lists.infradead.org
X-Gm-Message-State: AFuF++kdm5EX1l0rdE4MtaKz6sEZg+ZjvqN4fBGv7z0R3COk1SzfNXMl
	h4ud5lwm3qihkfoq9Hlq3Wnh8l6HLj4ng26t/eyc0Z4WAksl0/zvqwHAd4WY9J6Ogh79TxbphZm
	UjgI0W+eElSRp94vzCrPxrwI1x/3VAdKDzlabOtDkEiMzstK91cAz7Tb/A5ipNhbAdOb9y2PZBD
	QPHg==
X-Gm-Gg: AR+sD11OM/YT7rgmVga4A3Sazz2NVZMdjLb2/yVt9dnuIeUaYTUkPbznu40qGNQi7N3
	trJo9wA7fg8e/fIlN5ozsQl1D5a+awQlFOkXEBpssXljyzo3u+IAcvu83pVBn9bCJD+wa9KbnkZ
	hTSrABhOVh3TNVKz4mmHoHocaXuT6qa/Q0XW6zz7jPUDxlc1MD9kp53a/Y1Pymq33KkE10uWGmk
	jfTlkBhnJeaUJ0r0YnjsCjDRiOJ0t4MrDtQssdQTBZwDyyQWoOISHHAQjFHwsE9pDPuCa7Opdmn
	O/lcDYqykVyD4mRR9SXCVUA7M0AtGkrkg20NQDVR3JG6cUCXVstmVpLkNK6VgYmR09Kh1eLeD79
	0QnBvZ0JMWLBr8b0=
X-Received: by 2002:a05:622a:258e:b0:52d:9c11:8937 with SMTP id d75a77b69052e-52df5a07b1cmr265826491cf.26.1787571061011;
        Mon, 24 Aug 2026 04:31:01 -0700 (PDT)
X-Received: by 2002:a05:622a:258e:b0:52d:9c11:8937 with SMTP id d75a77b69052e-52df5a07b1cmr265825181cf.26.1787571060355;
        Mon, 24 Aug 2026 04:31:00 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1342817666b.46.2026.08.24.04.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:30:59 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:30:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
        p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com,
        royalnet026@gmail.com, u.kleine-koenig@baylibre.com,
        chaoyi.chen@rock-chips.com, diederik@cknow-tech.com,
        alchark@flipper.net, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 09/13] pmdomain/rockchip: cycle optional power-domain
 resets on power-on
Message-ID: <ry7vprhcjccrjyujmmpf4jgzjblhm744yborbnldvamj35h3wg@auo3ajz55com>
References: <f1805c2bce56c89d8ace35f67c665b24bab90965.1787568944.git.gahing@gahingwoo.com>
 <213e3746a36f821798d3fd3e5d832d89dcf2ddff.1787568944.git.gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <213e3746a36f821798d3fd3e5d832d89dcf2ddff.1787568944.git.gahing@gahingwoo.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX6GFtZp+of8q3
 FvGwm51zDFNMEKPRL2QwKvfqGYJeJ7im6eDZHesF/NS0NAn2FsmHievyiJS+TGukwTZqy1vBuYT
 2qum90gWxPEegQBT+MYZqzG1cAYWONs=
X-Proofpoint-GUID: marZscPdWAY1FFo0PoHk6eD9Ryw_Rhrp
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c2b75 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=9GNsruGHAAAA:8 a=EUspDBNiAAAA:8 a=u6E1p9BJNrHIpMXxc0cA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX6c6smNzpn+Vq
 4lPFqnhrhY5yXuTnsp5uMxGwqTqqqH3y3PDIZL36dgvufVth6QtNa/+lQHTWv4ZTAnJr6HJv3Wk
 7Du/UZwzxKJdhhhgnxK+Zf3r0FUofeJAlnOH8EyalfalKNSuMvO/SwV4TET2O0aVAog73YpakUp
 0AGqbgHqDZmitssqJ0D58moniT7SP83pJnq1V2iDN48tQ5PB1l8eUaX76rZ5j3czo6o0klfqjOA
 wCsH840kS/lDTO+YKm4HkpUEzyq+u5YIy/71sZbaOL4/vnkYpM7000uwWCDjjnyM3B9pTX2ssc0
 qEFFVADN6cwhKctufnIgdka4p6gYB385gR29mVJChSnPMW+yYm4QfdZBiHncYjKXYFY7UZccHi1
 5IUO1SmP/yOFjIXe6MSyk4+WTnNhWW+sKYLFZ/g7oFT6l8cjgQZhWHkIxauneQtuhrINqQJ3g//
 eIjR6QjrC59nmJ9r3Ug==
X-Proofpoint-ORIG-GUID: marZscPdWAY1FFo0PoHk6eD9Ryw_Rhrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_043106_321930_26360C5A 
X-CRM114-Status: GOOD (  13.41  )
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

On 26-08-24 23:08:58, Jiaxing Hu wrote:
> Some Rockchip domains come out of power-on with their bus interface in
> an undefined state. On the RK3576 NPU this shows up as a hang on the
> first register access after the domain is switched on, and pulsing the
> domain's resets at this point clears it.
> 
> Take the domain node's resets if it has any, and pulse them between
> releasing idle and restoring QoS. The resets are optional, so domains
> that do not list any are unaffected.
> 
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

