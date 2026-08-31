Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8766C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ha5fAnUZVZrjWDFhLPVJNlt0TSWD9lvu+/EaHaGmMUw=; b=rUyXLW1BxID3L6hBcrWFGmbFR5
	ExHo3DYbMIGJyCkBzqwuboelt/tgTE+cGgNFL44mts6BgTcM1CkY8dEVz4jGu8O3+U9gQq8hgEQyQ
	oJyUq16zi2fGqYBrFXYlG0JiXDCIqONdyaW2KW4LU+YiFfD1ljLk2Zbg+zLT7+MJ/+oL4YNeLIjwM
	gHBD+F3Aa2WPiJLx2a666Ud7tPGl1vIzJN378teC++rtVm5zEuj7mOORvqHtMexkTGY5WFO5+AAu4
	K64doM6feJOsZ6si9ShsKvKhBlsH55vAHDpSbqKQQHCilzXbBdGONmp809nDqThuqIH1oqOJkcsS9
	Bl6XmPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xSj-00000008uI4-0Vs5;
	Mon, 31 Aug 2026 08:33:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xSg-00000008uHF-2uP0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:33:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xT3I3018719
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 08:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ha5fAnUZVZrjWDFhLPVJNlt0
	TSWD9lvu+/EaHaGmMUw=; b=JElyMn5c2DESjvXs/Ccwb2wtyI8fwZYnffxiXzzD
	J/pnR644em3zP2kL8MwzkRFvoOQi0G7L1fOGQk9vyzd6wt6DEmUuraPip+8A0Aqm
	yxuYfHsA3BkS53wVB9yAvR4sdp2ploe3e+FZql3i9ZXlUZtIj5aecGZlL50eOEPM
	+/LoCscGI+3N9fBXOwJ1bV0baa0+AT84qTQ7hoJos+LTlMcYnHegR6+AxACdsfzK
	NS1KmTYX9Z6ifGAjxB0pOXYKa12WNmXnntF2b7tJbJu4nWjVynM84UV8WQloGfWy
	pI8ec0M324fZI/B8O0gwHOvR1jNUtLLvfuLdXQG41MyQxw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2nfp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 08:33:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0aso1490330a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 01:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165229; x=1788770029; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ha5fAnUZVZrjWDFhLPVJNlt0TSWD9lvu+/EaHaGmMUw=;
        b=QIUah0zkn3SbrVlYzANVaqVve+2reFACWg1G6kHc5awj/5mDx633bDQaDDpw+sNEAN
         chBQSQhB3ADcFS1fUlxW5kTEKUVg3VEeELJXm92IvFpGO8slyi0Ga1euu7Vp+t6X8xqS
         /O4nRLabySXPzGiD8Cg2bASFIz+msyvOZegSRNh3aTa6bhmbistgu7HFM8mMHDramwoI
         rbTGDpAjXiUBjWFbo9Bm6M5yaEhI4kWIeYaoTt/ICi5p6DG14wPevmlTM2a4y80wt2O+
         8nCHiElIfY2usVKmu9IrXNZK/xq4QteV6TmaDcaZamGmHleO5eewd1yGEeW7lJAqIY5w
         Wdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165229; x=1788770029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ha5fAnUZVZrjWDFhLPVJNlt0TSWD9lvu+/EaHaGmMUw=;
        b=NMk5iMvuqgOgP/NLmI2Rmo9MvH9mMgz5hXXv6UCH/U8iAV8FZkwIn1zmeOPWbI0Gmc
         bWtGlG9IeMPAoBUS4/6v4UypdjSjrsOW3SlNv1vYkFvLY8XrCjIE3svldYnWlYfFBlTj
         7Pdo7xPWdqd22C8h9O+gr3sa4Ui2l9AIWPQ3v6FGz+Zs6xLLrRrBkDwQQJKkIQB548PD
         cS4lK/Q98DS99JCRNgBTgUp9GGBddrkzs2aiOnzp2lRlwP31bOd/BubK9X3E9CeEHXB+
         TQame3Cv2PBaG1P1a92o5cyVgv6ianTwjMfRmxeNW5ii4fMMUhk5p1NLGzbXm2bKpw+3
         Zejg==
X-Forwarded-Encrypted: i=1; AKwUvBy8+eVW0ILiok4bK1vJNJf3tOO19AhJfgpzra4B817SJ8wHiX9GbJYG/KWptmt1zQdHQqXZoBw95A9JdPFzSBkJ@lists.infradead.org
X-Gm-Message-State: AFuF++np72E2xWeWGoGu2f8tASesTMQFdG2uJuwsWJ2rRIopWLkAU8gw
	DZHisV66bAfEjSsU/5OV1CmOLRiUbKISveEjatyT1NUZDrWn9RFb+R5vxoUCi4dMR+2eEdNhfea
	zx6Pa6br+LIXCzngb4IjoYIp8wRFodUFzypQ7QfKvbgyIBhwE8c9C7AiOEJVpiBGzvrfw+N9ikG
	PnIg==
X-Gm-Gg: AYBFou2tFCFySIRuvKy6OovVKdFSLUVuw8OAeC7YIN97RElosQFHgZXZetHV/uP8PYY
	eMoF3Yq/fuvdiO6HHSwC+/bhEXn8VndQsErXGOLid+Wu3DW3nWEuvZ3xAmLB5eEK1tM89RXREjA
	YSZpIwbRCjqpzqBBoO3x5FtU8HJnAd/L+CmkKQqyJeat6Ixd9Bf1kjcPd2N6lKvawP38YanwJ1v
	DKPHpU1ObgRxo92TEzNXu06wK5SCokeIuZOhKNdVYNEx2cY/q1znfFHK5YEswwWMho6roHwFqD2
	dkYr6TEmcOBKMEAinduclotM+z/evpIuuR3LMEHSC3Nbqo9CHtqPe12sE7Xe47MNQ5LnEU2hqvB
	p8hL2lz0f5MBJuw==
X-Received: by 2002:a17:90b:1845:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-398da5e8875mr5965749a91.1.1788165228515;
        Mon, 31 Aug 2026 01:33:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-398da5e8875mr5965699a91.1.1788165227912;
        Mon, 31 Aug 2026 01:33:47 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b58c057bbsm13558506eec.19.2026.08.31.01.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:33:47 -0700 (PDT)
Date: Mon, 31 Aug 2026 14:03:39 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <apU8Yx08/PJiS9Xw@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
 <ajF6q5eKz92ddqVl@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajF6q5eKz92ddqVl@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QKpUxQFQz1Bl656KQEhjDdOPLNU8eaWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX4Pje6bv2RWIi
 7X/js+bE5VfU2aPWYP3QpaClugpZ0432qs5m0+9heZtdDnlQH1oolLN5RpqPCwU8S2PQj3n3+tZ
 mLUHYooWQP0wxUwwlsL0PnwHEyyAgo0tAzkDm71aTYCKY9r4g3mEZCeK8ttSPpcyWkHmVDW3bSR
 BuehN6mDEcE1Z6qXNg2FOMAF6TLFYWXGkxLMweU3XEhvPPLUzQ4d8bmEkoRe2BEc3r4BmfRsDov
 zXxO4i+lVyc8Kq6mJ1IhgjNduUZRLfCHDHGbBDGLfZVh55INByXnLJ0+v4oyr88W7YVFvvjHiaI
 /VYmv18bt4i1VTjrzlPuAm2R25Zl0At8icbObHs3vp6+1xD2wLPbc5wEowRIQ0V8y92qGvabhMZ
 3VUjrq3skd4rTnJTnUK5tJFSMxDQemx62OA8Hmg5CMGsXcjxXCf5SmF/0rs7qmIEzZsDiy4UTtd
 F2FdVhP4FeMBpXFqc7g==
X-Proofpoint-GUID: QKpUxQFQz1Bl656KQEhjDdOPLNU8eaWc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX1AH0FqVF1l/0
 GSsNlMznBzSjvvy6uYfIpCJAzqQ7sf5kFP+myYcrNupotz2bAHEO0d4IV4BGPiNSL5107WPU0qp
 xuJ0YyIkVaGNXmpNjppfmChxK9KvmPo=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a953c6d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=4fMhwKYZf46Hqd9eeeQA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_013350_745144_90ADA815 
X-CRM114-Status: GOOD (  40.45  )
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

Hi Andrew,

On Tue, Jun 16, 2026 at 10:02:51PM +0530, Mohd Ayaan Anwar wrote:
> On Mon, Jun 15, 2026 at 06:48:55PM +0200, Andrew Lunn wrote:
> > > > I'm curious how this works at the moment? Do no boards make use of
> > > > RGMII ID? Are all current boards broken?
> > > 
> > > Searching through the DTS, I found that we have two boards using "rgmii"
> > > (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
> > > "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.
> > 
> > So this causes problems. We cannot break existing boards, yet it would
> > be good to fix the current broken behaviour.
> 
> I am trying to track down the sa8155-adp and sa8540p-ride boards. The
> EMAC on QCS404 is extremely similar to QCS615 Ride [0], and I got that
> board to work with this series (with RGMII ID mode). So I am fairly
> confident that QCS404 would not break (if its even booting up with the
> upstream kernel currently). Also, I think we could change the phy-mode
> for QCS404 to "rgmii-id" from "rgmii" if these fixes go in.
> 
> > It could be the best way forward is that you issue a warning when
> > "rgmii" is found and pass rgmii-id to the PHY. And you also change the
> > two boards to use rgmii-id. Lets think about the rgmii-txid case once
> > we better understand it.
> > 
> 
> As Konrad mentioned, it would be great to know if we can test out these
> boards. Looking at the different versions of the ETHQOS programming
> guide, stopping MAC side delay should be as simple as what we are doing
> in this commit. But whether the two boards work directly with the
> default PHY delays is unknown.
> 

So I did find the sa8540p-ride board but have so far been unsuccessful
in getting it to boot. While that goes on, I would like to proceed with
a series to fix RGMII on qcom-ethqos due to the following reasons:

 1. All versions of programming guides give a programming sequence for
 MAC-side delay or PHY-side delay. There is no concept of "rgmii-txid".

 2. I also found some downstream code that was using "rgmii" phy-mode to
 program MAC-side delays on the sa8540p-ride board. So it looks like
 "rgmii-txid" was a workaround to enable ethernet while support for
 this board was being upstreamed.

 3. I have been able to test this patch on a variety of boards now,
 including:
     - Shikra CQ/IQ variants (with the TI DP83867 PHY)
     - QCS615 Ride (with the Micrel KSZ9031 PHY)
     - Talos EVK (again with the Micrel KSZ9031 PHY)
     - Talos Lyra (with the TI DP83867 PHY)
 These platforms cover the two RGMII configurations that Qualcomm has
 typically deployed.

With this in mind, I was thinking of breaking up this patch series into
separate ones to solve one problem at a time:

 1. Introduce support for "rgmii-id" using PHY-side delays rather than
 MAC-provided delays. Also, issue a warning if any other phy-mode is
 being used.

 2. Fix the DTS of the existing boards to use "rgmii-id".

 3. Once the DTS is fixed, remove the now-unused code handling non
 RGMII-ID cases. This should also allow us to remove the whole
 ethqos_emac_por code since it wouldn't be needed for RGMII-ID.

 4. Add support for regulator voting in the DP83867 driver, mirroring
 what Daniel Thompson/ Alex Elder did for QCA8081 [1]. This will help
 in adding support for the Shikra/Talos Lyra boards which need the
 supply for the PHY to be explicitly enabled.

 5. Support for Shikra can be added once these changes are in.

Does this plan sound reasonable? Thanks.

	Ayaan
---
[1] https://lore.kernel.org/netdev/20260605010022.968612-3-elder@riscstar.com/

