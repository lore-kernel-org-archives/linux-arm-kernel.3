Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFBBCA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 03:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVFIzf6qKFdgBMbvBDNXwTubrxO8VTgmNkIEL5po9tQ=; b=bYnsnRCds5oCvtB1FlPXIAmtkR
	LyGmE2awkY1LjyHkQEM17bE8TGVg0SbSTcRpwrepd21kQOpbrhqwKCfALYY8lVskIevRZpjFd2UhU
	KRkn85Y8JYw+zRZIW3m3xSEqGWqgc37hGjQPrhPxtnDahy5Pic7J7/CIEnw9ZsnB8JoyoCc1bOHXL
	Ha6FKliX++3wZIYjXVnGGZ25zy66B02wWCxyXpnCzKqc9VnV0Zrr44mCFRCJHHfx05lf69I8+7roQ
	bJKxaxxRswAdCA848633LKSHlaN3vKY0cJCUGruXMLo4pIGGCKAwBD61iI6wXWH+e55MtWR9ckEgp
	fW34AHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFNe3-00000007Sq5-2EDv;
	Sat, 10 Oct 2026 03:21:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFNe0-00000007Spi-1AFj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 03:21:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2eUV44012306
	for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVFIzf6qKFdgBMbvBDNXwTubrxO8VTgmNkIEL5po9tQ=; b=W2DttC4+Bg/B+3ws
	bSXUDzF6IG5mn9xU5D6JiM7lZw3pUWzTMJL1e/ExEgPQoXH5O8xy5Z/6MAlhQY77
	VlOQUJG4NT2GfODiAHiTZZxrNjPI6WXgLhWaO2lUsjaQcYlTSKIY6xKybzBWjfTy
	HgWWh+E9E6YxKxW0WvBoapNv5ZeI7VSwPQ31kjh1faetbS7ZBhqjyvYPVzf7YDBC
	ogYA36T8Bm5eLxDYCSSw44cMmzsFpwWxc0Slc48GXkscp/JK/Y/wFsVDDXxl2FCp
	+VHbzZQ2lbLTaxlT6N/y19/pPAukUr08miotAn8OGlJgQzu5I0zu5XFR+JFHyi99
	M/eBxg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cc6854x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:21:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so431587a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 20:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791602464; cv=none;
        d=google.com; s=arc-20260327;
        b=OUq6Zo2OAXHbZgA8aQ7aMzT2LEAZOYsYPSL0QEd1Jux3nMdg7gqN1a8ixYH8hCZbRP
         sdcdM/+TmsV68PjDjqk/x72OV84gaTslDznZaXB1odfkE8FZhZQPf5GUSgq0u9hAustb
         1WvXCIfe7RMiVM0X/szSG7NbomEjgdHgItJU4ihqzZu4/zvWol7vnPlBYA/BewKzlZrG
         3d8PZb0TRF3QbuPbWwsVUSX7f/SEqHMEay22jeaJBuFtRe6oQSRd44ZAIGv4uxWWsFpT
         coQCMxb4uArZ6HLV5Ttfv7eej/CUsZY239bc4sra/7FFLNxU0cF3KdHUaIIlpGfwOczO
         rxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kVFIzf6qKFdgBMbvBDNXwTubrxO8VTgmNkIEL5po9tQ=;
        fh=FzSZ4Nt++6/pyPi/WetgHlMva8+WJIAvUA6Q0913hKU=;
        b=s7cs+CLAJTSWskLWLd5TpAIaXGLHPg4dqGg0tZrzUeoURxeK9flgb8NRao6bZlC9gH
         xsC0FSL8IGWa8u1PZTTGWnklBZEsjgO0UWuBF3JZfd5lxZzrI32PRatwjzn9DxfOEKD3
         clk0iBi3NxYIO7zTpiuowSAil8/AJrjcn+95yp+/6/iHHQHK8xDccxYbiI+yTTZlEbzI
         L9Lv6LCg7nb3LW6XugH+wNVoeftAZ4v40Nml2ZgQJ2LAlhmEa5H4Hg3KH+eVnGgJK0SA
         HRmPjSwBOxUZnGiWSggWnFQQs1mmyLvX95Br53sEEqLlH+BUWsgWb6iTx/ceMvJhp0MV
         jIzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791602464; x=1792207264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kVFIzf6qKFdgBMbvBDNXwTubrxO8VTgmNkIEL5po9tQ=;
        b=D/NqA3TVs+QqKelqQS8TdzeOGLIS/xJWqaHVT6ppo7iW5c7EQ1NIzvlGjJ/FrP2JZD
         DxxLCFWzG33T9LNKEGBTnWY/GSEolikq0lbnhRGFjdfH+x/HdYFV5jJ2HYf5NzyZm8bl
         gBcOEUHlyoUncqD+kvaweKmIIipYhGnRyNsrVvRnnBnSerCVJ7Pj8hGvQLJmMrRSL4qI
         Ot33CgnnQLZK1WDzZ8xYf92LtP+UPDuvx2Ss8sPJLvvguR+FXoxyjTxkV25gx79cKmnv
         DDNlusNNp6QxeGzFPs+m9u/FwibeW1WhDtHjZUdtvlMfThWopEhVGoTa/Rjkhu4bTdgI
         AUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602464; x=1792207264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVFIzf6qKFdgBMbvBDNXwTubrxO8VTgmNkIEL5po9tQ=;
        b=1iMg58gfWtAPQuhA3lAOg4rexHDNnMfZjS6i3AVdvvHCLnJfhWBuCfjr6gHjJH3PtY
         ePfch/48HEMMiy/PsNGThqSnD63D+txeP08a9+bnklkIv2yIG2+lwhJqnY91zIM1nVw8
         XaJsnH0DwIcLlSv7Z29Zfv53bbKHNtqt3KQmac2ActZkXQGFYaoj9WNMv2oYcCYJHH0g
         gTNN362ZFdolCVIb4VxChbBPDGHhIhH/vc8JD0eWVONBtuejJs5pz4KD5UVcFBYMEk1V
         ql4w6cmMm55Qhl5V49t9XLaL98bRDRMqvmghM6lDE4gemerl70wO28h0dQaSr/rvhEED
         cf+g==
X-Forwarded-Encrypted: i=1; AKwUvBzBJmDDgljVIXq5hwLCzkkyt+1+SdbHF9kEgALLbZ06zuCzS4zXHmUVzIOqp0v4MvLRIRUPdi309twmqmJudCQh@lists.infradead.org
X-Gm-Message-State: AFq9FYK0W0iBaq60G832PECxyt5Bj0PJaNsbAH6/CzJOf3HtlOnpLMDf
	Fk5bVjLcDsjnNkTlh0hjbFFheXDWURoLjSBnojfwv000gaccOYsc9qTy0dSvcHeLY260ISvQqgN
	4r4Hr9rixZRbndzuqK0DzmjU0982o5I+F3UCX2HKmI340B21eR6hlDRQxAFBrSTswZ/thdiZHEK
	QWvK0g663R2nMEVWf+Tv35bmme/CMothCuh9KGRqtRlGpyAR07U3Zh
X-Gm-Gg: AYBFou342UIcmAX092e5nk49O27Xj8w90aMrNPJ1WlNKHNeUdFPuMGIq8Jbeg+ScpKr
	CtCmMso+X684TPZtBtDfzYZh8D5oDwYuFlEHsOdDo8cwTkuvCxAZ8+gJB+VZFXCQt2Wf7Bwb2Nm
	QxQHxH1ElQDb7ZuyzmDuu17Z+2sXX5K9Ft1mLOwm22yZpR5/XQJloH8AaOdQ==
X-Received: by 2002:a17:90b:4d86:b0:3a8:6571:b43f with SMTP id 98e67ed59e1d1-3ab3a9f7f28mr3326748a91.29.1791602464034;
        Fri, 09 Oct 2026 20:21:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4d86:b0:3a8:6571:b43f with SMTP id
 98e67ed59e1d1-3ab3a9f7f28mr3326738a91.29.1791602463627; Fri, 09 Oct 2026
 20:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com> <asmbVX7U4cgm7XNB@QCOM-aGQu4IUr3Y>
In-Reply-To: <asmbVX7U4cgm7XNB@QCOM-aGQu4IUr3Y>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 11:20:52 +0800
X-Gm-Features: AclHuK8rsVvfZj_k56Q5QKzcsjlIbLPicr-jBYfM5wSUQDytqGrRVpofZv9SSgg
Message-ID: <CAFkd8huTuFii5PPYrZ85LKkoECbb8JD7eX=jWC+G4ac6QOBr6w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Nord ethernet followup
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: bartosz.golaszewski@oss.qualcomm.com, mohd.anwar@oss.qualcomm.com,
        maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: E6slIauBS2W7ItY7RTyfJkpDeQTHNAQV
X-Authority-Analysis: v=2.4 cv=XdQcX455 c=1 sm=1 tr=0 ts=6ac9af22 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YagQt7tFpqKSyC3IlFAA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX02UPdVtzWHVG
 vMLwXOqh15yxq7T7wrs/mUqnmYWnlc48QxOG60uALvJVltrD49wBAIOkc53mxBoBay3EYCBjz3E
 Kbx+xuoEQdB9ScMHvwzg6XourlnyPYqwVU1IQ7J1rPot05AfLcXraxy1oiChvJK2bYxKbrgm3iZ
 SsNrQuGWvrJYWxQ7tk+cN+oVxuBrWyqi7YDAqsZRFYxCouDpJcocwRMqS8ciBp1wKtq39ZGnftG
 BTnb4SbiOVRjTMSxpBxdu2P2/9jb2T6VSCSu3oNY3kXOPzPvjtmqGrNFnPLEsTY54hS5FE4qWCT
 tuBf56ZrwSkEwBkU1a9mUYJaF4b4iSPvDqJs8I3W2xEswsL6cbD1CLTMfw5yPOegZqMOVwe0RP4
 wahvjcbY1xAuWDJyIqQGmajd2gFHaJ7mlPKucEvcTwaLu0JARadL2eem2DvSMeWXz10oJhpwzm/
 tn2xgn2zMcDW5Fd9RRA==
X-Proofpoint-ORIG-GUID: E6slIauBS2W7ItY7RTyfJkpDeQTHNAQV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX+YWHiZT47DlK
 AT4ZVxhcBajmydPHxuoI1btn+EMKAwt1t5EMXYZaP0EYxPt8UGcGzZVN5dG0P/KjrJN467woeVj
 NbxFLbPIl/uNgocvm0+PKS8X3/2NlHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_202108_461518_2F527E14 
X-CRM114-Status: GOOD (  15.54  )
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

On Sat, Oct 10, 2026 at 9:56=E2=80=AFAM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> On Wed, Sep 23, 2026 at 04:49:18PM +0800, Zhangfei Gao wrote:
> > This series verifies Mohd Ayaan Anwar's patch set:
> >
> >   net: introduce Qualcomm XPCS support and add Nord Ethernet plumbing [=
1]
> >
> > Tested on both IQ10 RRD and Ride
> >
> > The full test branch is available at:
> >
> >   https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23
> >
> >
> > [1] https://lore.kernel.org/linux-arm-msm/?q=3Dqcom_xpcs_nord_emac
>
> Please do not post a patch series in reply to another. It makes life
> harder for thread viewer and b4 tool.

OK, got it, my bad.

Thanks

