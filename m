Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0259ED42BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKCG4kPuqmPzvoicL3hs8a+m3uMzwc2QiEhg+gjjy1Q=; b=vMy1FOSd7C9W3fKWrlsC/unJbZ
	AyANTplHEJJ0kGjtQmDMs1apU5g0i+raN0OBoruglBfeI3nqoobxXq28xHxFH+v5JcD8DUs4ztxek
	nktxllZ3KZFNJUkEq95EfFHb8TJm/AkYXhOfwLhf9m6V4CGfBMkkvnC0+U6+2TikaYOqdMFuAZ1hg
	brt03Xb8zr2Grb9gDyMnQ//KzyYXvLihET/lDAy+9ypTEGgbIIaTDqO731O+tXL8r2DRccRMIVYRn
	eVkG+dvUz6F4c+1+0QGg304V7HS0fFm9ZTzybP30FSRkpcanw3bM0cY9F+wwBxui4oQs/KR2lwYLF
	gjHt/VpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtcU-000000047Hv-1d3y;
	Tue, 12 Nov 2024 16:19:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtQs-0000000450E-2LUZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:07:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8A57CA41E45;
	Tue, 12 Nov 2024 16:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE60C4CECD;
	Tue, 12 Nov 2024 16:07:55 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: (subset) [PATCH v2 0/6] kselftest/arm64: Test floating point signal context restore in fp-stress
Date: Tue, 12 Nov 2024 16:07:35 +0000
Message-Id: <173142698242.893467.13323137433955232156.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
References: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_080758_684064_637D8582 
X-CRM114-Status: GOOD (  11.20  )
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

On Thu, 07 Nov 2024 01:39:19 +0000, Mark Brown wrote:
> Currently we test signal delivery to the programs run by fp-stress but
> our signal handlers simply count the number of signals seen and don't do
> anything with the floating point state.  The original fpsimd-test and
> sve-test programs had signal handlers called irritators which modify the
> live register state, verifying that we restore the signal context on
> return, but a combination of misleading comments and code resulted in
> them never being used and the equivalent handlers in the other tests
> being stubbed or omitted.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[3/6] kselftest/arm64: Corrupt P0 in the irritator when testing SSVE
      https://git.kernel.org/arm64/c/3e360ef0c0a1

-- 
Catalin


