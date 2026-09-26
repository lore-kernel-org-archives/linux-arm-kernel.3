Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B968EC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYxxudkVZ1VoNqwDsuEqFR76gpVJjA0lnUaaqwQi8ls=; b=VErm1/scHapzHskHVmKkl0jjuy
	z2DxaTA5o4y8j3cbMu0hDCGDc8BJ3m6f0y6q0/unc/YPUttwP4uqki5XhUC89IFiWv6XB1rDle9oX
	w+RusRFGWHE4/8fVgCDxlMWOW/ZoBmjnvoJFLdYmNU1SgtAY6xRzR4GhsvZWOYgnWrJ7YJtvQrxxL
	CcY1Xx5H6/leaMCXCYDFG9bvY1oERjECEkJwiGC258mhJDaEppHYCyZFEzrmL92HkoxYmhhctCUab
	uYu1eqlaREYgv51hvsW+zHa0IlCLIEgyGoDerjN9xhp2ozMH1iLnaiV5IoKfHIDCKbetuzVl/bKGj
	JWPW88kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASGN-0000000FQ7q-1tpD;
	Sat, 26 Sep 2026 13:16:23 +0000
Received: from mr-2005b-snip6-3.eps.apple.com ([2a01:b747:3000:206::17] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASGD-0000000FQ40-3UFS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 13:16:14 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 007361805189;
	Sat, 26 Sep 2026 13:16:09 +0000 (UTC)
X-ICL-RepId: 01a0dddb-e134-73b4-bb7b-d8f519d5127c
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGAV1cG1YPUl1TQw9MCwh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428573; x=1793020573; bh=IYxxudkVZ1VoNqwDsuEqFR76gpVJjA0lnUaaqwQi8ls=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=H4EdhRd7ntCnbZuBAUyr2TUtr0kx7bdrHj6Fg4N+tPNfUVUMiSfxxZEJErlSPMW82FdJp451WxzdVemC2VGRcq/2V8hPwVACMEmyWXXqD3K6+lcqeFZ1apG7zM2YNPr3JfxyYWeiPlaMKklLaQeguLEOLjy6ts/44IAUMELbD30zAPyxCdnSLT+s1ZIVAf2GkAm/9o1PFl6vyBKC7hu/W6uvSw9FrjCbNw61BGbpqNzDuY61SdHnvGDiu71UlIduNXuxDD9GGcPvQx1jZMisYBRAJYOwTZGb1fss2CM5eqqDNxxtyFQT4T7YEFMFcbpZ/2SegrkPR+oboFJLdHNSFA==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id AFC691800144;
	Sat, 26 Sep 2026 13:16:06 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:42 +0200
Subject: [PATCH v2 03/17] media: v4l2: Add Apple interchange pixel formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-3-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: RZxpVVsO5u48ZfgybvBa0VaPXOV-y4Ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX3lZGxroWTqfd
 oH/blGbdAuzAJKVGQWe9nCf+gN3nyhp8s+pgYl8mgs5GMjEldCXLsE2zklB2voHRHcqTAZAOBMM
 /zuuAjWXxfqrwDVW7AWohZLRGQq74KkirD4gplD6LX+25Mja5xuI9C0IoLcm4LVtDoieJvpAzKR
 /8OAbQAGVUZlo4xwc7IaiyrkwGuAEHlQkhXgjsQ/uEDD2Hcisz5O0kKgGg/PSp+t83mU5XWFNqX
 Ht6icTPIVr7w1Nkz1xcW69mqQCwvKznyHrJjUbmELlsUZqo67qxZH0wCtOMx+TDDrvVWBRphiBk
 n0HxXzV48Zm1/UDX+sz+S5wy37O3Clc2wUVxCJ0E12uhjw/MuNzFFcy4fYHzpw=
X-Authority-Info-Out: v=2.4 cv=LvifC3dc c=1 sm=1 tr=0 ts=6ab7c59b
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=XfseLEjigXvjOB_hP-0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: RZxpVVsO5u48ZfgybvBa0VaPXOV-y4Ht
X-JNJ: AAAAAAABChFGzoGZDGVrPPJyQR4WNO9HCGl4ynz/q7qHQ5r6QkvXaESA0fmFBgsmIy2NCVdDzZe5/nFZJmr9eHu/IPILRkouev0skqVKObGLe1c/XXwc4lLu+ZTOb2v8VdgdSp/31NcX+8ef/b4gEOcQglMXV4Cg2eWEhI0jtKRKJaU1jmy5u1L6FLMdoRi0BiqnKYlL9dGb8Rc0vZR4LIeFtDRC+n9x9GILi2YzPNydY9QQkuNsMgE8LUCR737lVzsfgp+OQAUJaRxd9VmzknDyMZRHlkvAU5AIhvxQMoHHIZZ06dMaMtJ35sZjE3rJYoTbbSTEZa6nlckoe9+/LCgIXx0sLVryq2K0NpiBXjt2Ide37fZFTDRXoX8bTW6FH1Lv5c4+0/yHKqzwtqFyVVZKXBZhxXWYFvQJ9FUmcEQw8aXJCU9gsRbz5aXtVsDithJyPH0b7JB0CijxeUBBkNr1U4mGwUxrxAzfyycg2uMI9+jvNLMV/5xz4IvAiTbDLZJWpkDw2ql3zdYpJ3oWYPdl3ZltXSBwZ+NaNd42LBj9y4M2WNcBNaJhikvDh5xv5LrP4URek642kgiK9tqmY36yjUDq0x5GI9zrpKvoPYcIc9I/PvhySvOPvKyChHObt9Kvzktj5LgGSh+e6ZJMxpG6ELrW1j5oRma256juqb2B6+5si+utRWP3Wviw/wrJH6HrciRCwkpmYIdyrOYqD543nEToGRB43Qz2qv5UuH/JOKg1CIg+HE+W7DPMuLFji3mO0Lg7QsoZGatkE28Z6CxhkZ6QBtSFN8+MDPXlCOJEYSTmI0CXq0q4YUjVeS0g8gDhcy3VtfTMb1lfGBKxrUGXKpeFRQ+oj+GE9YxHbKbWqmqv5LMhEz/vSrfxxwkNDohbfA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_061613_901837_23232507 
X-CRM114-Status: UNSURE (   9.66  )
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

Apple Interchange is a compressed and tiled format modifier.

Its intended use is for sharing buffers between hardware blocks (GPU,
display controller, video codecs) on Apple platforms.

Add it to the v4l2_format_info table to help with calculating sizes.

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 7 +++++++
 drivers/media/v4l2-core/v4l2-ioctl.c  | 6 ++++++
 include/uapi/linux/videodev2.h        | 8 ++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index b78fc0845a16..eb2eb1c59fdd 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -336,6 +336,13 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y12,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
+		{ .format = V4L2_PIX_FMT_IC12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_IC16, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_IC24, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_IC03, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_IC23, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_IC43, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+
 		/* Tiled YUV formats */
 		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_NV15_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 1f2519ffeb2b..b3c49b08ef2f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1561,6 +1561,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr = "PiSP 8b GBGB/RGRG mode2 compr"; break;
 		case V4L2_PIX_FMT_PISP_COMP2_BGGR: descr = "PiSP 8b BGBG/GRGR mode2 compr"; break;
 		case V4L2_PIX_FMT_PISP_COMP2_MONO: descr = "PiSP 8b monochrome mode2 compr"; break;
+		case V4L2_PIX_FMT_IC12:		descr = "Interchange NV12"; break;
+		case V4L2_PIX_FMT_IC16:		descr = "Interchange NV16"; break;
+		case V4L2_PIX_FMT_IC24:		descr = "Interchange NV24"; break;
+		case V4L2_PIX_FMT_IC03:		descr = "Interchange P030"; break;
+		case V4L2_PIX_FMT_IC23:		descr = "Interchange P230"; break;
+		case V4L2_PIX_FMT_IC43:		descr = "Interchange P430"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5472e433ed06..918e060b6fe0 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -842,6 +842,14 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B') /* PiSP 8-bit mode 2 compressed BGGR bayer */
 #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M') /* PiSP 8-bit mode 2 compressed monochrome */
 
+/* Apple Interchange, compressed and tiled formats */
+#define V4L2_PIX_FMT_IC12	v4l2_fourcc('I', 'C', '1', '2') /* Interchange NV12 */
+#define V4L2_PIX_FMT_IC16	v4l2_fourcc('I', 'C', '1', '6') /* Interchange NV16 */
+#define V4L2_PIX_FMT_IC24	v4l2_fourcc('I', 'C', '2', '4') /* Interchange NV24 */
+#define V4L2_PIX_FMT_IC03	v4l2_fourcc('I', 'C', '0', '3') /* Interchange P030 */
+#define V4L2_PIX_FMT_IC23	v4l2_fourcc('I', 'C', '2', '3') /* Interchange P230 */
+#define V4L2_PIX_FMT_IC43	v4l2_fourcc('I', 'C', '4', '3') /* Interchange P430 */
+
 /* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixels */
 #define V4L2_PIX_FMT_RAW_CRU10	v4l2_fourcc('C', 'R', '1', '0')
 #define V4L2_PIX_FMT_RAW_CRU12	v4l2_fourcc('C', 'R', '1', '2')

-- 
2.55.0


