Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6F4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ttio08oTSADz4D/Sdqy63zgVY4f9+DlzTAqpC3Lvk4=; b=n3EosaLsjP9EdBaFkuYFIM0RW7
	kCGRHkgNgIO9D7TYvYeqsBzTGfrIi1sY78KnpltapyZ/yRaM+NmPNOl6gIlE8mC9LN//2axRchKuy
	GUq/tR4FivDzIMssM1Ob0PJrxUk/fyieElRZZ7wKV1fW7LLnQxcxW7CRA8D4ltTHijeAe77rV8MEl
	1ufSFEyMe0QUvBeLUsV8bjoz9ja1kSr8T6tMESpkrXzNl64YJu2Q+7430k4a/iMZarmDr+nR4apYN
	7ONOs8mkcwu7MaxCiS8aqBU8yMHsiTTN/+J4tCAauqGBkcsmOynYcq84OoOVeAwFZQaHZbChobYXc
	H/Ec617w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z32-0000000EZj4-321x;
	Thu, 24 Apr 2025 16:03:36 +0000
Received: from p-east3-cluster7-host10-snip4-10.eps.apple.com ([57.103.84.231] helo=outbound.qs.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7unx-0000000DrgS-1Ilg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
	bh=6Ttio08oTSADz4D/Sdqy63zgVY4f9+DlzTAqpC3Lvk4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=tsVQ2KRiyGCIZQLb4G65HDJs1vpeeouwjaelagCLfL3NXGP+UVlNwIb5WoMjjuSai
	 Up7tFBXQPlHkmoShSz9jPaZfofxQNKyaZD7dZi8xpfOtSQQsxB2d+9ffn0kayCd5sc
	 JdltQBCD2bf+Mu2jRtjk/4nZmo6CcNxlbxE/D+NymdjMI/S45Y4FQ5kLUmE1Q1sHm5
	 +f+9FJc4wgb/L+X+SsBLrDMxQ5+bZ6zXPSB1FXd47il192LmMsfu4vGdzx95QatMLP
	 dlJbQnzwtoyuUr0FK0K9IiWD0W3MtcVijawtyQy05Gq4ZLbPXvpVmutBVUOMJMPPIE
	 Jrr6jl6T1c0rg==
Received: from localhost (qs-asmtp-me-k8s.p00.prod.me.com [17.57.155.37])
	by outbound.qs.icloud.com (Postfix) with ESMTPSA id 8D1E11801326;
	Thu, 24 Apr 2025 11:31:37 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: andyshrk@163.com
Cc: airlied@gmail.com,
	andy.yan@rock-chips.com,
	daniel@fooishbar.org,
	djc@djc.id.au,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	hjc@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	mail@etehtsea.me,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re:Re:Re: [PATCH v4] drm/rockchip: Disable AFBC for res >2560 on rk3399
Date: Thu, 24 Apr 2025 11:31:27 +0000
Message-ID: <20250424113130.7431-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <a893834.9206.196484ef2ab.Coremail.andyshrk@163.com>
References: <a893834.9206.196484ef2ab.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0lH5-8KJ1rBV-2m4q0bqzLQKWM_UHpbh
X-Proofpoint-ORIG-GUID: 0lH5-8KJ1rBV-2m4q0bqzLQKWM_UHpbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=1 suspectscore=0 mlxscore=1 clxscore=1030
 adultscore=0 malwarescore=0 mlxlogscore=190 bulkscore=0 phishscore=0
 spamscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504240077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_043145_485463_0F37EEA6 
X-CRM114-Status: UNSURE (   4.67  )
X-CRM114-Notice: Please train this message.
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

Hi, Andy and Daniel!

What is the status of this one? I've noticed it went to archived.
Is it good to go or not? Any further recommendations?

Thank you,
Konstantin

