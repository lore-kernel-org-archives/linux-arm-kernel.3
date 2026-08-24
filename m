Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBD8C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhZFMUq0G82N6cZ0jr/Dp8Ye4zJGl9JW5FIR7tFFlKM=; b=4lEuJBXn7ZWioeqfk6AzogvcH5
	hWFbQag2gogCDASZ62GiYChQf/HBaEXgIlcmlSxZLX3pO/y7PZeAltLXHRhUDVszvm/1CRDASwoew
	0vlWFKQf0acQs5X+bKVjCkpECP2hzniTFwOo72YeXo6qbMBQCOctvsm5TVb4OBgi1uBallFq+Dq2x
	ujJVPugFUPjQvQmmuW0HrGwJ3zjko1YwW/aOX8gx+HpVCOus5AQEgLezIjKyd2zWSB3orH6JHP3JP
	3y94M/AwIdmRSyxNrIsksL032cWWiWbDlFXIgYi+39jy1yO4wakbvZN4kgQZxIkoteghYqARLRBaq
	XedoAWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyStf-0000000GW1I-0org;
	Mon, 24 Aug 2026 11:31:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyStZ-0000000GVyc-0NRc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:31:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMhJG2372675
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uhZFMUq0G82N6cZ0jr/Dp8Ye
	4zJGl9JW5FIR7tFFlKM=; b=Gklqmwlfj9AzCkg/arOvToonrhf0bYY/rB+R88JX
	3w6WMi/u3Bi+iyuC5Z/s1CKgJvg9H3owZXmIpgfVN2qfyWO/yTvkxz9y8/Qja3ym
	liXTh6B+i0GkURoYSqt1egIKbsIjuYTVA4S2GymUThJ8m5yB4V4SuJAyhCNKzcrk
	cKoJk6hOpg/1VjmtI3TJ5U8NRRZ/Lbjalee64MB+/jjtG4LUjwHDfXUTHqZcCyEF
	+6hdoRjcq2ZOLtDL/ZaxPCFkoeon0XzTv36UH2wNqls/gmvgz5j0gGi5ukR/L8Xw
	N0xB4JnHmryBkKdZPwEGkkxIvj2IL7soNYf8wZSDCl+4Ug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshbvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:31:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d7b3adda4so35050061cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 04:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787571075; x=1788175875; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uhZFMUq0G82N6cZ0jr/Dp8Ye4zJGl9JW5FIR7tFFlKM=;
        b=Wo6sXe5U3cWicc7wiOpES/tC325t3kTTY3vAKC5mdXc2RQpKDk8Fs7nXQYVmvvAZW6
         NumuflsSAtcxvd08bkJENn+m8lInsqHIxYBGXYlcioGGn4d7MKDofUMpwp0iSqnLoE+9
         /CD1RvuWzRSJmsJktf3G6LO7bgvwmjKkgpslrL9TiWpLmDWdt/xtKxkdgBFU8QEoCcUE
         jtvtVvqPP2DUfdEtXofYWkIc43COyrIM7a+RaLHwin5R2Kvxjk1T1OS7dNqDtx72l2nn
         oiQt/de/33mBVa0g+Ghe86UwwEoGPde8EIE/U/eqV+28uPvNlepU2jWIJmSnXq4wXNgw
         wThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571075; x=1788175875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhZFMUq0G82N6cZ0jr/Dp8Ye4zJGl9JW5FIR7tFFlKM=;
        b=WZv2ftGho6f8fyPyYQagu+AbYiqGYHwUsi8vyKcel4uMoeWiKC3airR9MXGC8NbSaO
         kQ5VxwND2X/OkARCTJYlb1VI+IqgM3mJLXriHHtWwvdUa7NWL2kjvPxmdbXyBgeMGprj
         aWG6/DubZAjGaDbOkOrM8eAwkj6c/zMOfuceVx3TXYWx88CQ+kGu4JruucXtywJh/nbm
         Rt3A/LCZ/cliJKzTw5FqmOGjmmF5t3CsGZGx62+euv0IX7MOoJPlKbOe4U/YTikUS9Xs
         +B9KYPvhQ+HRycbVEyn4DceMePJyTFHK59cUCCPpcpEbFGjx8u7AU7PQB5t3LKEqmYtc
         sWKg==
X-Forwarded-Encrypted: i=1; AHgh+RrXFF+uJqW19BMF53hfm8ieK5gg09SLH0uTyYx/eW/ieO0jPMd1vlhPpFhzS8ezDFCpjPDJ4arMIQEQ7BLIL+z3@lists.infradead.org
X-Gm-Message-State: AFuF++kFaq7175DbEuyl4svBDwbqBml0+T2XheuP8yjmpXJF65mhfOKk
	JUQr/+JZit+3xwfndtZZ6r0h9n3xbqMYEeU22iOZ6HFnss22TdJCvv3vA0lAVMNXVnjfIQcszQ/
	rFxBJE5/twm4ctyczObyS9crYwKuz8Rj/8RumXXxDLTxXR8VGjgyyYm/0CW/rOX9Qa/FiEMAkYb
	xifQ==
X-Gm-Gg: AR+sD13l9BCwUkQPb20qiPvVPTT3wEqP1mVhQr7oo8Ogt1L/9i9CclJ12UJBE78o36t
	l5on1Ums0kLlPzX5QfN1EhbzqgSI6/w7z8X0z9bFNl+IVRleC/xYl7LpQyaLfPVLo2MXTy5HSIB
	yv9m8yDI3Bghb7Dom8mMg0sFloYAY4IQdxIV1KPuvVQ7VCIAtHUM+H11SJUKFx6oe2DBdRR+b0N
	Yci27c1lyQ9AGxBg2GN3WuunkRQdDGNyCK4It/lW/ywBbizcmU88jbihLB1qxnUyv2HN39Ljvws
	ceqYa0GvvYVKhSP+NX5MGJJr1HVxrh5AkNFyWSUfMegDgZgJewBy3UQ40EgZrrUTAZymbOgOpKv
	LShbrZwJzaqc/ufo=
X-Received: by 2002:a05:622a:4cc3:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-52df56e10f9mr245520921cf.5.1787571075025;
        Mon, 24 Aug 2026 04:31:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc3:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-52df56e10f9mr245519981cf.5.1787571074499;
        Mon, 24 Aug 2026 04:31:14 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1342927066b.46.2026.08.24.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:31:13 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:31:10 +0300
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
Subject: Re: [PATCH v9 08/13] pmdomain/rockchip: add optional per-domain
 power-on settle delay
Message-ID: <dn5vlrxg2vr64d56mqibriz5y7ebeqezkv6f2aqf5qd2gti6y2@ohdxvj5dnscc>
References: <f1805c2bce56c89d8ace35f67c665b24bab90965.1787568944.git.gahing@gahingwoo.com>
 <1b89eceeca92f7857d26c5d2097bea2bce10eb93.1787568944.git.gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b89eceeca92f7857d26c5d2097bea2bce10eb93.1787568944.git.gahing@gahingwoo.com>
X-Proofpoint-GUID: uSZGL6x4NhovSpzwqnNMdPr5HKjY_l0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX8SCQJPkCA4Or
 alwYKS8m0SVnFhPmL52X9/6ENwNabnVnY+DvXL7wUh8kxhUIaaRhGX6G2fCmoblfRKPkruc6FyO
 j1HyV5vjKGAPcmfl7A4Npuk5n+5pv0q2velwjuLO6FMrAjaG+HwpnaZeDlDcz6cdVO9n/AjHVV+
 JXjEnc2CHzPKWo3i3V5GOfEuSkT1njNZKcNwqQAHDLyIGLEW9w3jf0GpbzvxFuIZEOlpWe2WprR
 qsRR+I+JBOU6nEFIUHFX4t07INCQmzMDxCArex39MnDoGUgrto+BLBF2QzeaXxOaHPG092AeMVG
 E2KWX+x12/JHHiL148yQaUOsmt24i1iQ+aRsF7aRSnKzGR90CSDzJyCbhVj80tkXxz3HKUz19VD
 SzrjwrNXD4/ZFPXJUalLNTgrNlMIYnMeSVpm1JY37NcMPhWfACaAWv+MiV95/mlnyiaahyldbGh
 L/WyRro0FjCCAqU0nUA==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c2b83 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=9GNsruGHAAAA:8 a=EUspDBNiAAAA:8 a=lG5QNMjPvMxfgh1q_X8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-ORIG-GUID: uSZGL6x4NhovSpzwqnNMdPr5HKjY_l0O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX0jwuLsHYWfZZ
 YoxhRqHqvNfI0R1ztD+yieDFtzV+lOPiTRWDQgu4nfJGL34FSl4o+eAgTvyJha9skaiasLy6Dnb
 eCZR8xYrT4EIvQBK/uQUEuvSiFGAvvw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_043117_242660_283DD18E 
X-CRM114-Status: GOOD (  18.50  )
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

On 26-08-24 23:08:57, Jiaxing Hu wrote:
> The RK3576 NPU domains need a short settle time after the idle request
> is released before the registers behind the domain answer. Without it
> the QoS writes that rockchip_pmu_restore_qos() issues land while the
> domain is still coming up, and the NPU throws an async SError on the
> first cold power-on.
> 
> Give rockchip_domain_info an optional delay_us and wait for it between
> releasing idle and restoring QoS. Rename DOMAIN_M_O_R_G to
> DOMAIN_M_O_R_G_W, since the suffixes name the fields the macro sets and
> this one now also carries a wakeup delay; RK3576 is its only user, so
> the old spelling is not kept around.
> 
> While the macro is being rewritten, give it the regulator argument that
> DOMAIN_M_O_R and DOMAIN_M_R already take. Without .need_regulator set,
> rockchip_pd_regulator_enable() returns early for every RK3576 domain, so
> a domain-supply in the device tree is never looked up and never enabled.
> Add a DOMAIN_RK3576_R spelling that passes true and use it for
> RK3576_PD_NPU, which is the one RK3576 domain with a rail of its own;
> every other domain passes false and is unchanged.
> 
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

