Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E9AC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL0Oyp88GwG7kNOMBo/yujFF8wNjRPW6Iy2PxK6WeBs=; b=rZGTkwhthbmwkk9HOVRo7pntKv
	A4Z9DVxkAoEGwWlJymw0is0pbugVhFwkLTLDtXl0aORC+siIRd7g2UtaG4r+Wgp2I1/RxewwY74rw
	lzXT216sYertDkcfzrlhjhcN1MsaH6FrxjVsat1FtFrAG3rm3tP/XTYcmiKBa+4cUWC+snTgLMNNq
	TiAaxpdV56bllEmimC7mYTYUSShMTAgKBXY7NEDf5ok9GFCzNTEsjr2dM8slBncnYr6th0IaniR08
	xqeD/S4K7zDKhuW1MN75KR0vMfwChKHOOlzd3T4xm85FVJIwOGxm+oC47lN22De/En7ass86wx0yA
	qc1SO/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS6S-00000000NK3-3QHw;
	Thu, 13 Aug 2026 09:52:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS6P-00000000NJe-3DmW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:51:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D923pT3421996
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fL0Oyp88GwG7kNOMBo/yujFF8wNjRPW6Iy2PxK6WeBs=; b=UFUCq942nrPbctuG
	znqVroq90ZHi1z6V+1XxkjtfazzjyNXp2Y5VDZ2/qipRLuIKKF2bhPW20H7MJyJn
	ldj7zeVIUXvmcnOP6NqpwPSHfc/gOTnu0k3wh6zQ37txwhhZhyDi1+4xp5s9E5EP
	J89+jJvxeqB+yci1ay4nwuxkLbFEn0PiNs3HFW9pX2biFiMB5Tc9UFn+eojAwBZh
	20AIDG9+031yQBtGkVM5WV9lJP/wToh0JbZCeSDF7VH2Wj0oQ2CIkar/zmxa6vBE
	QSeQfgHKFd9Rjx5CtCeAgvmgh7RFgWC+xDJRgdnEHwcCl+UXNb1Cw0kdOi+lMxIU
	WVBh8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g152m9nr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:51:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so10451085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 02:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786614716; cv=none;
        d=google.com; s=arc-20260327;
        b=G+ApAQnxRFM5spn+bQ8tBCCBq0cYJ2v7R/cjwmazzUslXn+LB77CcRheCh0V/bjf/y
         N/9Qi7T355pJs3gk7GrXRpCu0UL/cz1mtZrJK6/i5bi0ruLUS0V/PXssu//LMXLgl0fz
         MmBNRrp2NAfFwpfeuo5eZ10zF8HLKDilkIAQAU0aHx+8kjB1ChPQFKyeOX9787/cl75d
         EV8qoaSGvee/c5CJE3hL5kWsdWv4HGwMHuO0VQ5HCte9tmMIsbcqWcZ2T10OAmE44yJY
         UACW13BZwlsaU3QkSUJNMtYSjiRc7ttUjx1LdUWXWhGJKl7Ut/qBhfjGFWEVunJLtTUd
         FbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fL0Oyp88GwG7kNOMBo/yujFF8wNjRPW6Iy2PxK6WeBs=;
        fh=s7D2H9xMJswr40kgXXxfECKAZcC1IA3Ot36BGFODXV8=;
        b=Du/wzyQHVlfWVkyaP2m27u8sCTIHSut9BCZ38ZaNLmk8G0/f/xi5lxXjZ7vvo80MyD
         YAFrqYtqbzxg9Xh2TZf/ftc8r4jCRLM1+xb36B5tGItqEGp1HDehlQQbj+uYbO9tt61+
         OL0ZaovlS6NDZLe/oljnP+E0OJlOxVUTNSsFaxSA8k9VER7GCSs0FCMvM+fO5ZZNZhXb
         hceDUlQUnnLhckqcZH3b/1nVmntE3BpLdP83A8QhtXEeJ1rq1Yl2Sy8VO53TtUUVkY4y
         k0aJ6ShNByDe/6K+s9Eek8WkvnIyFNkONKs8jqG9Z/o3ihZgifOkRG2SFbRmiDKfT9Pm
         8aew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786614716; x=1787219516; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fL0Oyp88GwG7kNOMBo/yujFF8wNjRPW6Iy2PxK6WeBs=;
        b=belSeturkJr6T2jcZFvJvwjkjOtkYFfcnpBohOyG49aFU+GRKJzD3ePALt4uFHQQLP
         rZLyOZTEfxqw8Z3k4wbEiOnUHHhezqIF2WaI2bbXZIUxc2p+tpyhY+rrpBpxdJiIWD9a
         6aisnx877vslEy3hf8xNh+Rs2y3Vt1dXbiHXGY135zi/e8EzPpEJupCmFQW9qhjnO/UO
         Rkd01pp17OOIfE4nLvrpRpOJ9MWQGEKa/YRM0384zrOewrQLRqHsCsoLDKVY7C8Ry1dz
         vUsXwEV7PZqMrTB+YvjjHFNoLKazJmT5HobLDpcvpNcOtwVKYV/8kjozJQqz9YQtJktx
         G/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614716; x=1787219516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fL0Oyp88GwG7kNOMBo/yujFF8wNjRPW6Iy2PxK6WeBs=;
        b=k7MAyK+sC849Hb03p6DPD0B/zhpKM6KtLOw4tVTrZcEU1S+U6cx0HS+kBTnoZFHSFo
         GMHOeotTnXwl5j9WHh6y+QesmmPiKAj2n3/+Ozb+t9cWDKJLkVTEpYGsUYdyA/L7EM8W
         AGMRG3yTqYREYKIFUCQZ8nCt7Y/PCSuNueGT4W8HEL5LrsE03/dPuPl8JMzkd8KNfozV
         1Z0sjRv9H4o1ayCASWbu3QjsnBxAIYucS66N51pBKMZrluf20cbUXBFROMWBS2KXNA6i
         UBSoWlVnzF9zqMMnwjvRy8lfapRCxcc6mtvsicmzwKIUCbv2RRSP5OaqhDhEP2Zx4PSb
         rspQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5nGFuZ5ILCMjHcA0l9g3/pO/OBkCoKlYVcHqCaud4nzLV33hhz0C2DS8QjupUS0mjyKZ1wUJj4VStCGf5Znzn@lists.infradead.org
X-Gm-Message-State: AOJu0YwLp8kcu5knwykgKdh9lzhDKZi7yF/0Xw9kZNPZsliQyR0J/5Mc
	xXGq04qHljAeRjBNWIPQTLOd3VOgu/wRne+rS3Ky5NObJYJhPP+6n6y+jGghFIva0laU8FHpEpp
	uRoBRGsEjDjtAHUQUasRdpCaOHBXv1I2+p0Wg2Irxd0ctz96V94M1WFxGTaoQ8W8nuSpwBZACaz
	gtPO3Lhq3lUFVNb59vCKUVZ6qOZbsjBnF+9eIAYcq5IH/VzI66aXBz
X-Gm-Gg: AR+sD10RRVYiTuPgCmWKwbyMlPX6AI6UxHSCxRVj2IEJhK4TYyEjNP+x0oqZoX7yXrK
	qCB5n6s0OIZavBAElL8czFqcxyKlAFfnZA3QzoYtJr9aINxC3EeL5JnTLnFGeYfEEr/J9Uq1Fa5
	0jZbtSU/s6L2JXyXrc9ZzZ6yeozPMJyHp/q7VmKdXPPRYH+oDfE3f5xX4UjA==
X-Received: by 2002:a17:902:d4c7:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d37e833aa5mr44485495ad.13.1786614716126;
        Thu, 13 Aug 2026 02:51:56 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:2c9:a5e9:c26e with SMTP id
 d9443c01a7336-2d37e833aa5mr44485025ad.13.1786614715579; Thu, 13 Aug 2026
 02:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla> <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
 <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
 <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com> <20260723-light-aardwolf-of-swiftness-1c46ea@sudeepholla>
In-Reply-To: <20260723-light-aardwolf-of-swiftness-1c46ea@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 11:51:42 +0200
X-Gm-Features: AUfX_mzzSEQffGx9CifuPbFV5RxAKHUylsQq-VNyHO84epcOG5G-e9RJOaAN9Os
Message-ID: <CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZVYO=38R2cLV8nw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Cc: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>, ulfh@kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA2OCBTYWx0ZWRfX0hqcE5PdGsJT
 gdAsUMQILO/ZqN0wOhtQxaPQNYi2vf5qQdTFu65XgDsumLyHATvwHH/o/Y+d5hpmffQk4ObudWk
 E3We4ak0hybvv/+u6l7aVJrD0omBOkQ=
X-Proofpoint-GUID: Zk8yzGIFXKpYG9csGFaUBXGgC0hu8OcJ
X-Authority-Analysis: v=2.4 cv=D8R37PRj c=1 sm=1 tr=0 ts=6a7d93bc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=c5Fe1Fe05ZhRYI1i2R0A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA2OCBTYWx0ZWRfX2yMP7Z4ZrMF8
 U3lPAx5YMAcYKkeI3ikfgX/hgJdNRgmNIrDgav/jnbZQSvBj936awGTX8PVTxyDPQKqLNrlE7ux
 E2QYCkTuMbThAdaZKQP6jLknP0BmDFzerVnRQsQOPvFcd0F3ZKv5T8FSTBj3VonzcYzOAKq81oU
 nrrvc407Wwp0PoVLp04tBrzIeWNPm5Td+khWLX4dNBPmxyRNoA/yFc4uKQUoIaTWCGa6LN4wZnD
 kjpAjbZOaClSS+kZ34MVhOvcpgWmRWvR435iTUZwdDCQ90+QOdvyOtMgAnGZFl4pcd1uYM/lJOA
 KK9p/OH4eomwQJiNViZLoP55IxbTqSznqOvcjwD3rOW3NNFtOd61yv0HH2nES9WPav0+B+hyg/D
 WTsgGQnhGR/n9Yfoeyja+bPRI4qoU71QE9F3TrAs1z1/Zj3V/AeEXtThEAKxc+1WD6S4423DzvO
 D6TuJm8/+qIOPsgsf1A==
X-Proofpoint-ORIG-GUID: Zk8yzGIFXKpYG9csGFaUBXGgC0hu8OcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_025157_841884_72D00D5B 
X-CRM114-Status: GOOD (  57.35  )
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

+ linux-pm

On Thu, Jul 23, 2026 at 3:45=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Mon, May 25, 2026 at 06:47:27PM +0530, Maulik Shah (mkshah) wrote:
> >
> >
> > On 12/19/2025 3:51 PM, Sudeep Holla wrote:
> > > On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
> > >>
> > >>
> > >> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
> > >>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
> > >>>> This patch series adds support for CoreSight components local to C=
PU clusters,
> > >>>> including funnel, replicator, and TMC, which reside within CPU clu=
ster power
> > >>>> domains. These components require special handling due to power do=
main
> > >>>> constraints.
> > >>>>
> > >>>
> > >>> Could you clarify why PSCI-based power domains associated with clus=
ters in
> > >>> domain-idle-states cannot address these requirements, given that PS=
CI CPU-idle
> > >>> OSI mode was originally intended to support them? My understanding =
of this
> > >>> patch series is that OSI mode is unable to do so, which, if accurat=
e, appears
> > >>> to be a flaw that should be corrected.
> > >>
> > >> It is due to the particular characteristics of the CPU cluster power
> > >> domain.Runtime PM for CPU devices works little different, it is most=
ly used
> > >> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genp=
d
> > >> framework to manage the last CPU handling in cluster.
> > >
> > > That is indeed the intended design. Could you clarify which specific
> > > characteristics differentiate it here?
> >
> > Sorry for coming very late on this.
> >
> > This series is intended to handle coresight components which resides wi=
thin CPU cluster.
> > For the cases where cluster is in deepest idle low power mode or all CP=
Us belonging to cluster
> > are hotplugged off, access to coresight components can not be done.
> >
>
> Sure, but the question is why is the cluster entering deepest idle state =
if
> coresight is in use ?
>
> > The implementation tried to address in two parts,
> > 1. Using cluster power-domain to know which coresight component belongs=
 to which cluster/CPUs
>
> OK
>
> > 2. Schedule the task on intended cluster's CPU to make sure the CPU (an=
d cluster) power is
> > ON while coresight component of the cluster is being accessed (using sm=
p_call_function_single()).
> >
>
> Why, just block any cluster entering deeper idle state when corresponding
> coresight component is in use. This should be taken care automatically.
>
> > The use of power-domains in (1) will limit this to PSCI OS-Initiated mo=
de,
>
> Yes
>
> > to have this support on PSCI Platform-Coordinated mode too, probably in=
stead of power-domains,
> > cpu-maps (which also defines the clusters) from device tree is a better=
 choice which will give
> > the information on which CPU belongs to which cluster.
> >
>
> No, let the platform deal with it. And the whole OSI mode was pushed givi=
ng
> such use-case as example and now you are telling you want to solve the pr=
oblem
> for PC mode. I am confused. Just use OSI.
>
> > (2) ensured that scheduling happened on intended CPU and while the acce=
ss is in progress, CPU (and
> > cluster) will not enter power down in between.
> >
>
> No, just block entering that state in OS(for OSI) and in the platform(for=
 PC)
>
> > >
> > >> It doesn=E2=80=99t really send IPI to wakeup CPU device (It don=E2=
=80=99t have
> > >> .power_on/.power_off) callback implemented which gets invoked from
> > >> .runtime_resume callback. This behavior is aligned with the upstream=
 Kernel.
> > >>
> > >
> > > I am quite lost here. Why is it necessary to wake up the CPU? If I un=
derstand
> > > correctly, all of this complexity is meant to ensure that the cluster=
 power
> > > domain is enabled before any of the funnel registers are accessed. Is=
 that
> > > correct?
> >
> > Yes, This is to ensure that CPU (and cluster) power is ON while coresig=
ht components
> > for same cluster are being accessed.
> >
>
> Or just don't turn off cluster if coresight is enabled and in use.
>
> > >
> > > If so, and if the cluster domains are already defined as the power do=
mains for
> > > these funnel devices, then they should be requested to power on autom=
atically
> > > before any register access occurs. Is that not the case?
> >
> > Cluster power-domains will be only available for PSCI OS-initiated mode=
 but also
> > will not help for cases where all CPUs in cluster are hotplugged off as=
 hotplugs are
> > platform coordinated.
> >
>
> See above, let platform deal with it. It is called PC for that reason.

I agree. If PC mode is used, then the FW should manage this through
another channel, like SCMI for example.

>
> > After discussion with our HW team to automatically request power on for=
 coresight
> > component GPR [1] can be used but they seems not working as intended on=
 the existing
> > SoCs and will be available on next generation SoC.
> >
> > [1] https://developer.arm.com/documentation/ddi0480/d/Functional-Overvi=
ew/Granular-Power-Requestor
> >
>
> You are looking at it from wrong side as you allowed cluster to power dow=
n
> when the coresight in the cluster power domain was still in use, right ?

This coresight part that is about to be configured for profiling
belongs to one CPU cluster. The current CPU we are running on when
starting the configuration, belongs to another cluster.

Hence, the cluster that contains the CPU for profiling may be turned
off. See more below.

>
> > >
> > > What am I missing in this reasoning?
> > >
> > > The only explanation I can see is that the firmware does not properly=
 honor
> > > power-domain requests coming directly from the OS. I believe that may=
 be the
> > > case, but I would be glad to be proven wrong.
> > >
> >
> > please see below comment for more details, This seems not a firmware is=
sue.
> >
> > >>>
> > >>>> Unlike system-level CoreSight devices, these components share the =
CPU cluster's
> > >>>> power domain. When the cluster enters low-power mode (LPM), their =
registers
> > >>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring =
the cluster
> > >>>> out of LPM, making standard register access unreliable.
> > >>>>
> > >>>
> > >>> Are these devices the only ones on the system that are uniquely bou=
nd to
> > >>> cluster-level power domains? If not, what additional devices share =
this
> > >>> dependency so that we can understand how they are managed in compar=
ison?
> > >>>
> > >>
> > >> Yes, devices like ETM and TRBE also share this power domain and acce=
ss constraint.
> > >> Their drivers naturally handle enablement/disablement on the specifi=
c CPU they
> > >> belong to (e.g., via hotplug callbacks or existing smp_call_function=
 paths).
> > >
> > > I understand many things are possible to implement, but the key quest=
ion
> > > remains: why doesn=E2=80=99t the existing OSI mechanism - added speci=
fically to cover
> > > cases like this solve the problem today?
> > >
> > > Especially on platforms with OSI enabled, what concrete limitation fo=
rces us
> > > into this additional =E2=80=9Cwake-up=E2=80=9D path instead of relyin=
g on OSI to manage the
> > > dependency/power sequencing?
> >
> > + Ulf in loop.
> >
> > Current platforms with OSI enabled, Linux PSCI do not implement the pow=
er_on/power_off
> > requests, as far as i know, runtime PM was never meant to implement thi=
s part and
> > pm_runtime_get_sync() (from drivers/cpuidle/cpuidle-psci.c) call is onl=
y used to convey
> > to cluster power domains about a child CPU/ sub domain being on after i=
t has already
> > been landed in Linux.
> >
>
> When a shared power domain has one of the consumer active, why is the pow=
er
> domain being turned off. OSI is supposed to handle that, I still don't
> understand what am I missing ?
>
> > The standalone invoke of pm_runtime_get_sync() from another CPU do not =
really turn on/get
> > the CPU (and cluster), as the CPUs either use CPUidle / CPU hotplug pat=
hs to enter/exit
> > low power mode.

This is the main problem!

Calling pm_runtime_get_sync() on a device, doesn't necessarily power
on the CPU PM domain (cluster) it belongs to.

At the moment pm_runtime_get_sync(), for CPU PM domains, only
guarantees that an already powered-on CPU PM domain stays powered on
if it's already on.

I am working on a patch to fix this in a generic way, I will keep you poste=
d.

[...]

Kind regards
Uffe

