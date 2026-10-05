Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24825CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 06:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7hb38lOShKOX4DAhIwGSWhb0M9uMInsEx4DUw+3QwE=; b=mP7W1TzAbmpfIEewdC9FQDWqPi
	3sXj9ogWdcqnR3pzEm+jm23FUKWwaQ0IrzVlsMevzlCp7mgW8fTCkn+tU4bqOmYgWX31JPhemyqtA
	xSdAVzhltW2GatPAVv2u2ntplzrq932jfIS8tS97lBXzqHCbWfJomnYwaVjOV9iTLNVv/mNcEjh+G
	xQHxB7KPrJaJ9UkOwVXlLqyKSlFlOGxaqzUYwycA1okN0TnrqJPjzRzyFlOkMvMXPhYQdVFUlVfne
	2WdlV/3Vb+sQoT7ddymt/YoncPgIWdJACfnLr/mM8iURSTuNTayWmXoZSo56pqpv6ofZrBSeMwTiv
	Esjsaf7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDbvm-0000000FiZj-0AXZ;
	Mon, 05 Oct 2026 06:12:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDbvj-0000000FiZ2-306u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 06:12:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695104fl3242471
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Oct 2026 06:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t7hb38lOShKOX4DAhIwGSWhb
	0M9uMInsEx4DUw+3QwE=; b=YXZK+4GPpzMCvnrdxr/eWpCSzCoK2Lg37phfzFk5
	zkBHHg0RCOAQ9RgdZfwxHuZRvGJtMuxw8BiPvOX5UDlHfo2X65BfVsIz7tuctDlQ
	WmPE8+lKb/pgizHDJKrexbNwQ4BKfMBYIUWfe0RI+fxJJCABR9epOgppauBeW3sV
	JxX6wGbDPkLo5GQst1OEUa58hKtkBIc9XFTRf/J3xaCY/nfHKSFJgm6xOIEIvIG3
	zuyOimWGNpjoKhhlhtafxUvdnxR2sXpilQw7ujwtM9PvqMuWxYTWb6d5hupo9pK/
	mPHKFLcN+BQB2YOgnt9eYvzcC//p5zczmmxbrGImHdBTMg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvevhjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 06:12:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1580370a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 23:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791180717; x=1791785517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7hb38lOShKOX4DAhIwGSWhb0M9uMInsEx4DUw+3QwE=;
        b=WxR+vJ1+LLBqmg+Ce7tFUhAC6YmgC31JU1r1eNbsAWfutI6MnWZ/EybvaM1ZyT5Acv
         D1s0ItQRyRQJ3FM3YqzwlNnyOWEtI52CCcSDrBWtOtG7kQd6WOHno+gCGdLc/oV+N2yJ
         lEYDhKJB5nqauJuOblOhN1eOM8In07ZXGu4EzT98FjDCXkKShtCJl244EFoxarlZfSYi
         qWWhcMGQq1D+jJF0OrFiroyINpTSSZ6MFrWKHL/BWC8+l9VkUvZj6PmMrDP5jqNXlRxC
         GShq07gGwN87NL48z7LqtruHFWET908PmLW+kd8FebFTPZUClqS5V3KFO1r1NrQhmVjZ
         wTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791180717; x=1791785517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7hb38lOShKOX4DAhIwGSWhb0M9uMInsEx4DUw+3QwE=;
        b=fh4Ot12wjCFoD695ts2jn57hS0qyC81b33SFb7uUQGect3yyYoNZQShvcVpUPNlgnc
         JWo+ggcsf32eOtZ2/TkaUTyT0MEM1BtuoR4GahnmESjt0zOVAlQhumGliCJ1nMmC/lpr
         zN7AEbgXlIPuLE7gSx0MT+7DzUG8BHmtx1RNX3nGcEQ5cQBkcGIoNnCjVSiQkRSOvMFL
         F0MkLpeeO16sJWN0lsQQGkJYHHAavh+pxz7wymEhYJC+I9ZyJwEwv1rCDj1qVs97Q3bz
         9Ez2WVfL8fHMU8pGR9w1UvTguIk5Htva6+Hxx/GhYT1ZZ8F2Cp7mA55EoDYEbMElLbIK
         /7/A==
X-Forwarded-Encrypted: i=1; AKwUvBwUxiEWu2otgey4Cw5hZnCwbsyOoPAP49rCq6Gp1Q6ES4OJRMW7K45RK0qa41sdZkDWKs52Wk9uXsiC6VTZR6pR@lists.infradead.org
X-Gm-Message-State: AFq9FYKDQHXFUGzBlYw9QL3Sqhih5RCIdmYoCE+nkOYNyxAX5gaNi0mC
	rDUwE2I6m0m+gK8aE2Xye8Iz368fMJ2hjEeE3s0OFI/60XVAWiVEMRPF8PZ3+Z0r+aGTxCX4SCY
	gn7rAzfC0+wzfdKyHdhMAupmNljpyY36Pg5O/t1x5yHUqNyU+zrnN1v52cStPPsuXaUTO6tNu9t
	z59w==
X-Gm-Gg: AYBFou34QX9Ovxv+vgqw9RrlzAaVwGVlfrSs6Ci/FHxpQErvOQVOTmz0xPzn4taq54h
	8RtHQ4MwqwVmLs2v3oLugXk+qcAqx1zPhFlM+CeFVWUD13bfXXLiHAuoSetZIAOqvk4695Po40j
	f2HjqUbIexmnp/CF39xclr27/wd6x/K6CJf8pvmjT/CrgnTRGChYCkuYS4eFrtbaKKafMsq6l6+
	mPj8Va0pat6pbM5hsEOSTcI0cPKaDk32GklLRDU87Ar5ENB+hWIcwL5E+f1e8THc/KIRg1xzkwH
	4a+4b3f2pza776f5DpQZfZkSK9NnYQvBDfcjek5FlF4Hr583VVKUioxAauP6K60v+mKuyMJRtYs
	8vxizqO95vnP4gv6MnGipFFpOU4cry78YfBmg
X-Received: by 2002:a17:90a:2d7:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3a6d02b0fd3mr4447672a91.4.1791180717183;
        Sun, 04 Oct 2026 23:11:57 -0700 (PDT)
X-Received: by 2002:a17:90a:2d7:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3a6d02b0fd3mr4447663a91.4.1791180716723;
        Sun, 04 Oct 2026 23:11:56 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e472b48sm9294888a91.8.2026.10.04.23.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:11:56 -0700 (PDT)
Date: Mon, 5 Oct 2026 11:41:49 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel
 overlays for Monaco/Lemans EVK
Message-ID: <asM/pR6C0RpmUR5y@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <aqLGFfQ20mCGFkfl@baldur>
 <aqt72zoSNVGrcY9t@hu-ssmaurya-hyd.qualcomm.com>
 <arsp-8KPqD_skD5D@zenbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arsp-8KPqD_skD5D@zenbook>
X-Proofpoint-ORIG-GUID: Gsfa1fBBnYOf919PCDi35NiQb6O8cE8d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNCBTYWx0ZWRfX0e+/2iN2D86+
 H+g3cHggd/q2GCxt9km25y/+/H9ZGADtViv5BF7uE0dudey8MASbnZ/w5TMJF3lRvmS8XqlgNcJ
 GTqC6SumVLS1CcRxL8bIqR8tInw3yck=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac33fb2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=D-uZpU5vEzOSoVvPSTgA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNCBTYWx0ZWRfX8DsL1zPGl++3
 2NtbBf8SVZ4m0icHRUkYWA6NC3dzpfWREEfHivCm9QPEmm6JcMc5LG2hWR9I40rte47KSmcbIC2
 EwQpspx5a8H/Y9zpAzGAE6uVznG/H0gZOmex7GSAa0Wvy0kkjCb7r7TwCRa7e6peLELyKoExtWi
 0GuALnFKP+LXrn9cCm8hC84BNEYLY1ltWfg2euhWnqDcZrHO+2Y9n83X3xXhiZLDafc1PrYwOmK
 p4Y7t+arShN/8XfUup+VBGKht5OudrKLFhdOGqqDUaOMF+jsCIQNR2WDMHSKnC8Pp1XSZlLGZAu
 eoEJHYriiIMaVv56oihWMdwka3EsI3Na6eh3o40VRiuOSJFja/e7NvsMcu/fq1yHWiGn6RNZmLW
 MMDYUzmiNlNgguJKRhlB4Fw/sR4l2P8dY+I65Sm/ph+5+tVwhhSLGpi2ArO0LmvJ9ilxrCYWPTq
 byywozgoh9J+OCJuc4w==
X-Proofpoint-GUID: Gsfa1fBBnYOf919PCDi35NiQb6O8cE8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_231207_790486_F77B2E24 
X-CRM114-Status: GOOD (  42.91  )
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

On Mon, Sep 28, 2026 at 10:05:20PM -0500, Bjorn Andersson wrote:
> On Thu, Sep 17, 2026 at 11:04:19AM +0530, Shashank Maurya wrote:
> > On Thu, Sep 10, 2026 at 02:35:41PM -0500, Bjorn Andersson wrote:
> > > On Mon, Sep 07, 2026 at 12:03:52PM +0530, Shashank Maurya wrote:
> > > > Add device tree overlays to enable support for the Raspberry Pi 7-inch
> > > > DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.
> > > > 
> > > > The overlays configure the panel on the primary DSI interface using
> > > > a 2-lane DSI connection and instantiate the panel MCU on the
> > > > corresponding touchscreen I2C bus for each platform. The changes
> > > > allow the Raspberry Pi 7-inch display to be used as an external
> > > > display option on both EVKs without affecting the default platform
> > > > configuration.
> > > > 
> > > > ---
> > > > To: Bjorn Andersson <andersson@kernel.org>
> > > > To: Konrad Dybcio <konradybcio@kernel.org>
> > > > To: Rob Herring <robh@kernel.org>
> > > > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > > To: Conor Dooley <conor+dt@kernel.org>
> > > > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > > > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > > > Cc: linux-arm-msm@vger.kernel.org
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Cc: linux-rpi-kernel@lists.infradead.org
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > 
> > > > ---
> > > > Shashank Maurya (2):
> > > >       arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > > >       arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > > > 
> > > >  arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
> > > >  .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
> > > >  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
> > > >  3 files changed, 169 insertions(+)
> > > > ---
> > > > base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
> > > > change-id: 20260907-rpi_dts_overlay-58088ffce047
> > > > prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
> > > 
> > > The two dts patches in this series clearly relates to those two
> > > regulator patches, which has received change requests.
> > > 
> > > I would have sent the 4 patches together in a series, but as you didn't
> > > you sent this series with unmet dependencies.
> > > 
> > > All I can do now is reject this series as well. Please send v2 once the
> > > driver changes has been merged and you have validated this again.
> > > 
> > > Regards,
> > > Bjorn
> > > 
> > > > prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
> > > > prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9
> > > > 
> > > > Best regards,
> > > > --  
> > > > Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > > > 
> > 
> > Hi Bjorn,
> > 
> > Thanks for the review.
> > 
> > The regulator patches and DTS patches are targeting different maintainer trees 
> > and therefore were developed and submitted from separate workspaces. While the
> > DTS changes depend on the regulator updates, the two sets of patches cannot 
> > realistically be carried in a single series because they are reviewed and 
> > merged through different paths.
> > 
> 
> In reality, Mark has shown many times that he's able to pick individual
> patches from a series and the 4 patches are better reviewed together.
> 
> > I submitted the DTS series separately to start the review process in parallel,
> > but I understand your concern about the unresolved dependency.
> > 
> 
> Please send patches that are ready to be merged, and when you do make
> sure you send them in a way and at a time where they can be merged.
> 
> Thanks,
> Bjorn
> 
> > Regards,
> > Shashank

Sure, I was not aware that Mark can pick driver patch from here directly.
Driver patch is already in process, once driver patch is merged I'll post next 
revision of this patch after valdiation.

Thanks,
Shashank.

