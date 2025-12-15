Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA8AD5B863
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 18:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvM3nlX8+ME0WFJmJSAeD/T7bNtIKcLZyE2C2EAFuO0=; b=JgEx8nEpthG/P1G1pIYpjYN+n3
	IvPDXpKbGzzpEMwJnUH1UOE4ykAV9RCQe0WBc3UWS6I/gNSdBLt/CHSN94y+Av413dQOIJ4GVHxDT
	4wxE531pECVgvDfb3ac1XhgesRfLrpf77Dn6SI3s2r/gZEasQ6FUVFZC8DH1cs5+2v8gmTO/5VzE5
	zUY/Zq7tYjN3Prvo6O4JtBF3AUkE1+ulusy/z6pouH7Dc1qapBAkYsj5vEpPpOBayhZ+shQheISjM
	YL5CAje3DLz3CSDJM9ZcDNFsPYkDQErxeL7KjLu+jefvkMEJU7rzw03VYdTsi6Wj2nXhO2lrPZa6Q
	r/+bhf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVD8i-000000047h2-43pY;
	Mon, 15 Dec 2025 18:17:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVD8g-000000047g3-0pvD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 18:17:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA303FEC;
	Mon, 15 Dec 2025 10:17:33 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBA9B3F694;
	Mon, 15 Dec 2025 10:17:39 -0800 (PST)
Date: Mon, 15 Dec 2025 18:17:37 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yury Khrustalev <Yury.Khrustalev@arm.com>
Subject: Re: [PATCH] arm64/gcs: Flush the GCS locking state on exec
Message-ID: <176582226393.1756467.9855121048488078844.b4-ty@arm.com>
References: <20251129-arm64-gcs-flush-lock-v1-1-902b3ba6f39d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129-arm64-gcs-flush-lock-v1-1-902b3ba6f39d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_101742_272532_93CD3D96 
X-CRM114-Status: UNSURE (   8.20  )
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

On Sat, 29 Nov 2025 00:48:45 +0000, Mark Brown wrote:
> When we exec a new task we forget to flush the set of locked GCS mode bits.
> Since we do flush the rest of the state this means that if GCS is locked
> the new task will be unable to enable GCS, it will be locked as being
> disabled. Add the expected flush.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/gcs: Flush the GCS locking state on exec
      https://git.kernel.org/arm64/c/98a97bf41528

-- 
Catalin

