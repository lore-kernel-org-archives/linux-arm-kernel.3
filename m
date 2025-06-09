Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB961C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJuH77BbGmYiuOQiiQN1dGKMkzBu7JXHvZ21w7w7CwI=; b=lO45L76TgfXrOfa5OjcFNql+Pi
	Vv9jdH9l0wIJW7SJgUB4xSLEWHc3sdzAehjko4Y2e+ONDkG+n3e+T/72uVm+sbSU0FNBG0fAYlnAn
	Mum44M/GukHHNzAKWFDyu4fxhpng8EPM+e4YhOs+kpbr1Dxbs4yREWPH5uKO9tm+LRU9duoV95CHx
	U/S7rzghOkHD4RYSfi6inDXsSWwgBK+oWdsgIeiw7qwOoFFtKVUlOL6fUSzNklS916JZGteXOWKbv
	k4O5Ad5dLC8orZgExZzNsZyLmb545xnMIuYSqyoa/42sN6TAS1HUQs9dhPs6Nq/VBJbJZ7VlIj/8N
	oqzIlp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOf1K-00000004c9u-3Yvw;
	Mon, 09 Jun 2025 16:06:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeNj-00000004WEM-0Rkj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:25:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCC344AD6A;
	Mon,  9 Jun 2025 15:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D31C4CEF4;
	Mon,  9 Jun 2025 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749482750;
	bh=ZlGXBtC6ZrZFPsq+ynuRGU8ta7/2vHtqg+uKCS3Bd4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FfCRXUbIxZ1yChYr+LJFjCUG2Q5R7SmeGsW/yw3dW5wLy1kuvE0yaSvOChnnZpMCO
	 W61RUiwn9/C3zY2TYLm68cj87HROJ/EZyqtpA/5V36ND5tXWkCH+ET/5VFao7TjcHE
	 S4lcrFJB5WxNHo2TzP/2Gd6rUdYc6XeMzRfY/J0II+O5WuE6CMMprC7bfqC3bC+v4w
	 7bf3Q6z6o2TfQpOOXfPxBZeXhwbHiRttL9x5tbD4HyeyQlSHMjldJi8FFhIHagbHfv
	 8KS5RxT5rEDNMkHcM5/WENBfUjbbExFpM+BofhYETCBbw8IHPe1iTqrGezcZAWxwgW
	 67PBsM5Yyz0mA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Jun 2025 16:25:32 +0100
Subject: [PATCH v2 2/3] kselftest/arm64: Fix test for streaming FPSIMD
 write in sve-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-kselftest-arm64-ssve-fixups-v2-2-998fcfa6f240@kernel.org>
References: <20250609-kselftest-arm64-ssve-fixups-v2-0-998fcfa6f240@kernel.org>
In-Reply-To: <20250609-kselftest-arm64-ssve-fixups-v2-0-998fcfa6f240@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZlGXBtC6ZrZFPsq+ynuRGU8ta7/2vHtqg+uKCS3Bd4w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoRvz2r6SxCP4huYS9jkPSYPBOOariafPEGsrXVtPc
 XZnIrxSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEb89gAKCRAk1otyXVSH0HobB/
 9hffmWG8loihFaTVyD/cuxx9e0wo8M/WeQRiBK0zRTPnZ7kZlOdc3u9jqt7wxqapaQ32jE+wT981Rm
 t5lnYpYXmR+OuWraQQpvno1NYaXV9ZMFuiytxVHyOeGxcbSiL50YVqTUpw+jG2oA4uuHxjuf7ElJba
 T5OKQpd86uJ7tkUF/NAo59hxD8V7+H1hyFK8fDyHebCDzqae+M7L4xIUeq5Xj2g+nKX1lZCW5wEydx
 EOYq9tDpiHqK/glaVVFr39GMZxdi8bJ6I8LkS4ITJA2A5j18gxlsmccDwrARCnd5+uIlqK1Xm5BN7L
 yctD0C3AY9tZYbUcZ/Itxph1iSxiSu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_082551_170330_5FC7DE9C 
X-CRM114-Status: GOOD (  12.34  )
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

Since f916dd32a943 ("arm64/fpsimd: ptrace: Mandate SVE payload for
streaming-mode state") we do not support writing FPSIMD payload data when
writing NT_ARM_SSVE but the sve-ptrace test has an explicit test for
this being supported which was not updated to reflect the new behaviour.
Fix the test to expect a failure when writing FPSIMD data to the
streaming mode register set.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index c499d5789dd5..7e259907805b 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -301,8 +301,10 @@ static void ptrace_sve_fpsimd(pid_t child, const struct vec_type *type)
 			p[j] = j;
 	}
 
+	/* This should only succeed for SVE */
 	ret = set_sve(child, type, sve);
-	ksft_test_result(ret == 0, "%s FPSIMD set via SVE: %d\n",
+	ksft_test_result((type->regset == NT_ARM_SVE) == (ret == 0),
+			 "%s FPSIMD set via SVE: %d\n",
 			 type->name, ret);
 	if (ret)
 		goto out;

-- 
2.39.5


