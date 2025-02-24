Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A324C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noZHVLSF3h7hKAjQZ/VCvQY0kjlT62H69LdUcMJIhCg=; b=DMCcG3cBVAMJBjd7W/8Sj3dsGe
	AhnhdUlK+Re6z2n/gtQXlihujHzk3D0T0Dhp3obDNAUvAPwqXZx4YETw+zOoui/cTp4aJ9MiXIGNI
	WGFnsgJ5iCaKjctSqvcIZbYGW5G7qMFll4nG/vvT34m+dZgnAqrWySI98spylP/ytMim9BJPSBw03
	ARzJ5KFGZK8mqhx2UvVmXa+6jkXuMG4vz+HiVSJ03TjyKqDP/b9gYAHG7KcEXjZG06w1cPkM7be8p
	cBNBMluZBX0CjN+ttqPhyLbhPsxJKE1RLRnT5Y/yCpsJOSdYc2VRmGQjDH7rEZai+NXcgkOKq2J2c
	qvDnXiOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfMC-0000000F8tB-26xf;
	Mon, 24 Feb 2025 20:47:16 +0000
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfEY-0000000F7a8-1aWy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:39:23 +0000
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Z1szD6jmbz8snD;
	Mon, 24 Feb 2025 21:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1740429561; bh=noZHVLSF3h7hKAjQZ/VCvQY0kjlT62H69LdUcMJIhCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=pt8ej8hPguiGhxOJGWJA3Ym6n6lZSbNUoW5FJ+SRATpnN/AU0tK7udawXe3+ggKUb
	 tkLqDsyivIPqQbGyI2wJgp+7N1Al7IryPoQ4YxStxXumzUzeEf/i1jPQAQFgoy2Ayw
	 lyesPhgS5IntM20GnmCB4j7EVfFOPCTMtZLvNWjLYB6vBTlc/BAo6UE6vxoV+/H+fw
	 PjGLlumxMXsapRBc5ERBIa2mf9ADjbmwDi5VD8XB8slDA/4AmOaiyodPQrJ85Yhsms
	 Aj0yicrWYelvP8xU7Iq04TJMe7hWwQ4rPzBP4hMziVqpJ9epwVWdTCkiAI1PUaFxYg
	 rO1G/IaBKjvVg==
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:362e:e00:55a6:11d5:2473:17a9
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:362e:e00:55a6:11d5:2473:17a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX19dMwhCmCOPbU26XMvpPI/TJlM0l3YfMgs=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Z1sz96rnpz8sns;
	Mon, 24 Feb 2025 21:39:17 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [RFC PATCH 4/9] bpf: Return EFAULT on internal errors
Date: Mon, 24 Feb 2025 21:36:14 +0100
Message-ID: <20250224203619.594724-5-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224203619.594724-1-luis.gerhorst@fau.de>
References: <20250224203619.594724-1-luis.gerhorst@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_123922_559366_9206366A 
X-CRM114-Status: GOOD (  10.18  )
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

This prevents us from trying to recover from these on speculative paths
in the future.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index d8a95b84c566..03e27b012af3 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -11368,7 +11368,7 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 				verbose(env, "verifier internal error:");
 				verbose(env, "func %s has non-overwritten BPF_PTR_POISON return type\n",
 					func_id_name(func_id));
-				return -EINVAL;
+				return -EFAULT;
 			}
 			ret_btf = btf_vmlinux;
 			ret_btf_id = *fn->ret_btf_id;
@@ -14856,12 +14856,12 @@ static int adjust_reg_min_max_vals(struct bpf_verifier_env *env,
 	if (WARN_ON_ONCE(ptr_reg)) {
 		print_verifier_state(env, vstate, vstate->curframe, true);
 		verbose(env, "verifier internal error: unexpected ptr_reg\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 	if (WARN_ON(!src_reg)) {
 		print_verifier_state(env, vstate, vstate->curframe, true);
 		verbose(env, "verifier internal error: no src_reg\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 	err = adjust_scalar_min_max_vals(env, insn, dst_reg, *src_reg);
 	if (err)
-- 
2.48.1


