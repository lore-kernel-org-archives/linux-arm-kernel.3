Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DE1D3ABCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8qMr+kFMGHYdJmV7yoOqSjFddz6lSv14K8Fau+VSRdI=; b=iWhD7weH7B2sBv
	Ecb8YHnV1IxFrhL8t/q6BovA7T9mLpku0YND9+eeVVYUYv9ryvVqNKHr0jhrIPMDFmG66pfWNtnUs
	OYOwGiIRG3zjpJzddvLSH6i1zHSDesV0DQmaeP204shYel2ZY3QfG8Pde373Yu92gxKrJy78wVovz
	b1J8D4l9ITRgZtFqszSsnlGrCq1cJ4cy45NZpwiRwpD7c5CIRANkgGpj5tFRhEWnGLG2tgeYz7gx4
	Fb3/K0VhEuCvq1FuGM8FO23OhS9nJuIcE9N117RozZfhY/7osvzuyuYjatXIVIAIy+wl+ViLcRvmw
	DcQPAgf7PGY1+vvKAjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXBL-00000000Z25-2VC1;
	Mon, 11 Nov 2024 16:22:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAX8C-00000000YbI-0H56
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 16:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE699A417A8;
	Mon, 11 Nov 2024 16:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D65BC4CECF;
	Mon, 11 Nov 2024 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731341950;
	bh=m/AeiM/whS+c6xBBzNvf1hd5pMNDw3SCnJ5DVbjF9gI=;
	h=From:Subject:Date:To:Cc:From;
	b=ELhnZSmJ690rhtOXcbSHTcG0If5zx1CN1amSkhucDxE1xlEV4i+ysGe1Z4w8CGjIv
	 BO2bubCoeVh3ri7SVIJ0DYhlrVn06MgffHhAgHTJdea2rWwXp2+1qYrtDqUIGDhrjq
	 9upPtyw8uBefuT2nhnDXxEneTH3IKxhDg1NG3APMLFX72Y2/s7WygediC2+iN31gQ4
	 nrZ5oNdt1Lu082AHzVhS3TqYOo0QMCYgIiEOLKcYRkTG3JH+Pu73W6Ruxpq6qm40B+
	 AFUvoWo8OUMbl92U7khnUUQOFmnA1mBZyEb0vzZYGbnIVt+e7oRq0d+u+s1BqX/snK
	 70RNDayx8bYrw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] kselftest/arm64: Avoid detecting spurious PAC key
 collisions
Date: Mon, 11 Nov 2024 16:18:54 +0000
Message-Id: <20241111-arm64-pac-test-collisions-v1-0-171875f37e44@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG4uMmcC/x2MywqAIBAAf0X23EKaFfUr0UFsrYVeuBJB9O9Jc
 5vDzANCkUmgVw9Eulj42LPoQoFf3D4T8pQdTGmszqCLW2PxdB4TSUJ/rOsfCdaNrkI9BbJtB7k
 /IwW+//cwvu8HNxd9AWsAAAA=
X-Change-ID: 20241111-arm64-pac-test-collisions-5613f5dfe479
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m/AeiM/whS+c6xBBzNvf1hd5pMNDw3SCnJ5DVbjF9gI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnMi56xmL05NyNLFXLuO7+1tHJWJ3tdzbjRn94L
 NzxqKQkaFWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZzIuegAKCRAk1otyXVSH
 0JdkB/kBO+9SbtwHZL3Z7Pz+Pnhb9/0457z4NwOemai2FoOr83bgZxeTDiQ0d8p1WClM+dFV679
 vJBxmp92NECT5oGNfO8Oi1cOBpGHLHEoPyZafzFjgmchdVvy4oeixUtRGanXokMLVEWMZn7CWTh
 AvYLuSqkY97Dip1B5rkmmYcdrHkm9wwuZ/q1L2wHeLvxgNt7uz1Fwz+emkbv1M+2NFBPl+g7nLr
 TQkqfPQBFBzZ9Y/ZRJPQzpRo4+/8mMBEUAN8L00IdOynNx3KPJ2KijfNxWLGzqxcgy9VrKScBu8
 4wG4PmsmwVZKNhSof5bmXuPw4kMcXYSe3JIkwp3mjmlR+D/E
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_081912_203422_4B59D343 
X-CRM114-Status: UNSURE (   8.66  )
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

The PAC tests currently generate a very small number of false failures
since the limited size of PAC keys, especially with fewer bits allocated
for PAC due to larger VA, means collisions in generated PACs are
possible even if the PAC keys are different.  The test tries to work around
this by testing repeatedly but doesn't iterate often enough to be
reliable.

We also fix a leak of file descriptors in the exec test which doesn't
matter now but can become an issue when the number of iterations is
increased, we can bump into limits on allocated file descriptors.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      kselftest/arm64: Don't leak pipe fds in pac.exec_sign_all()
      kselftest/arm64: Try harder to generate different keys during PAC tests

 tools/testing/selftests/arm64/pauth/pac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241111-arm64-pac-test-collisions-5613f5dfe479

Best regards,
-- 
Mark Brown <broonie@kernel.org>


