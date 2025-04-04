Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5A7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKirpVkEz0ChY7jTwFcXSqWs07Jy481WAPdkGheoElQ=; b=xaWU70/Kc+ka7zX+d6+EtmsLBM
	ZqzBButslmqwh3gl39IsiqMOJxptbzrE/WNZ5oq8bo43iWnPfh77hNdBBNKXn5INXtHi+ikyNelZT
	hD/xUstXnPPHI0qN7xubMu3e8sxFGCC6fmlDVs1XlkyufHFkXZqJmSS+O2B/SrYvFgKcPRpyw5D5g
	cvjC01qYvjHe2cgk0RP5+NvyvQZP/LIlbrX7c845Wc2ANSAMDmAP7h26Ag69OxagUXZ2ARRHAvwqs
	c8mclYGUsB6YE2Pl8BQOOfWwzebHUcVPobR+q3ubGj+1rR5K4RWcM9AqJz2w1zUJxwiefpzjgJNPR
	/V2CK+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gWF-0000000Bixz-117c;
	Fri, 04 Apr 2025 12:51:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gUU-0000000BimC-4BqF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 12:49:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 738F65C5C17;
	Fri,  4 Apr 2025 12:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A78C4CEE9;
	Fri,  4 Apr 2025 12:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743770986;
	bh=EeLqqJ6DT2lADn0IeVVIkvThc5qK5gAKvLEOpACZaDM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a3geZInSexjWvt5mjvpsTem3QIeTOEQvGxa+rSJfzwcDwtvuL344224B7EhMp+BtR
	 3ZM7U366kVPL42fwYQK024Jk6NGAflVpPbDmR7At66URbC2mRYr9lhBZ7pvUrT2Gdz
	 kZbxFqyFWBLghgBqFmvoxPxljT9Yb0FLPKZIubJLubouFP4xwcAWpl9FeeXY5Z3uTS
	 5tkHwNywh5MZkTnvlFDXZdyar0lWUcZBQCkXEukZZGPaWuPf0t/+eVNB5sMQHJNO63
	 YNCW2C+3V5I8ZrW01L2ZyT9sJx8Qy0OCMaT3aNT2t/8vuUmCIf9YKtWTelFo0/xBMg
	 1LKCHzuYpmXSQ==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 05/10] dt-bindings: mfd: syscon: add
 qcom,apq8064-mmss-sfpb
Message-Id: <174377098243.316090.8544403801957208673.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 13:49:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_054947_073455_1DC82AD5 
X-CRM114-Status: UNSURE (   5.52  )
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

On Tue, 18 Mar 2025 15:21:58 +0200, Dmitry Baryshkov wrote:
> Add compat string for Qualcomm MultiMedia SubSystem System FPB.
> 
> 

Applied, thanks!

[05/10] dt-bindings: mfd: syscon: add qcom,apq8064-mmss-sfpb
        commit: 8a5d347da6ab0208ca348c91d598070bf763fcab

--
Lee Jones [李琼斯]


