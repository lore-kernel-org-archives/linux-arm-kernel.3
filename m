Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6070CE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiAV08T5VRR9d0O03+oXWl0muSUJxK+zYN5oKgt3eFU=; b=VYrOrFHkjxn69/I53PQbNdEXGw
	PpnJb6dfkFmZfK4/KtEENen2k7LkPqCUNb7eI5sC1KL30EV8wgvz4z8EdFxIa9swAvcxYTF/oN1KA
	x72Ec6K5MPOU4UCNY2uyeF3SsPY61Mk3G+Nicsm4trc2xfnQWoLuhfaAfMHM9+rbn8Wiwg8/POAVB
	1tIpziPmjhXJPw7/b0Mt6AuJadIVY8skWX89VDHqS9kCfQCQgZeQey4Cx9UkLu2T16q1V6mvBGcNU
	ADj+H21Jz3Wf1heyZiGPw9v6ewoWh1iUPHFe0ABUHIVS2MmRqEqJphbDvffXwLOlsRbAIchyqvsuk
	CAhTveZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgqc-00000000K28-3mBI;
	Mon, 06 Jan 2025 06:44:22 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgpP-00000000Jo3-1vfs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 06:43:09 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4YRPkM21tzz4f3jMK
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jan 2025 14:42:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 8E5CD1A0ACF
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jan 2025 14:42:56 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP2 (Coremail) with SMTP id Syh0CgD3AGRve3tn+wG3AA--.5981S2;
	Mon, 06 Jan 2025 14:42:56 +0800 (CST)
Message-ID: <4a3f8848-7d3f-42ae-ac30-93d9bef83fc9@huaweicloud.com>
Date: Mon, 6 Jan 2025 14:42:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/3] bpf, arm64: Simplify if logic in
 emit_lse_atomic()
Content-Language: en-US
To: Peilin Ye <yepeilin@google.com>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <e8520e5503a489e2dea8526077976ae5a0ab1849.1735868489.git.yepeilin@google.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <e8520e5503a489e2dea8526077976ae5a0ab1849.1735868489.git.yepeilin@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgD3AGRve3tn+wG3AA--.5981S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy3WFW5KF43Zr1kAFykAFb_yoWkZFc_GF
	WxGa12grs3tr1fZrWUCF15GFyIkw4DGF1fJry7KFWDt3sIqr18JrWkKryfWryfXrsFkrWr
	ZrykJas7tw1jvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIa
	0PDUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_224307_842359_1373B5B9 
X-CRM114-Status: GOOD (  12.72  )
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

On 1/3/2025 10:02 AM, Peilin Ye wrote:
> Delete that unnecessary outer if clause.  No functional change.
> 
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>   arch/arm64/net/bpf_jit_comp.c | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index 66708b95493a..9040033eb1ea 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -648,16 +648,14 @@ static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
>   	const s16 off = insn->off;
>   	u8 reg = dst;
>   
> -	if (off || arena) {
> -		if (off) {
> -			emit_a64_mov_i(1, tmp, off, ctx);
> -			emit(A64_ADD(1, tmp, tmp, dst), ctx);
> -			reg = tmp;
> -		}
> -		if (arena) {
> -			emit(A64_ADD(1, tmp, reg, arena_vm_base), ctx);
> -			reg = tmp;
> -		}
> +	if (off) {
> +		emit_a64_mov_i(1, tmp, off, ctx);
> +		emit(A64_ADD(1, tmp, tmp, dst), ctx);
> +		reg = tmp;
> +	}
> +	if (arena) {
> +		emit(A64_ADD(1, tmp, reg, arena_vm_base), ctx);
> +		reg = tmp;
>   	}
>   
>   	switch (insn->imm) {

Thanks for the improvements.

For the series:

Acked-by: Xu Kuohai <xukuohai@huawei.com>


